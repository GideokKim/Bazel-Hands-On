# Stage 06

This guide provides an approach to splitting your `WORKSPACE` file into multiple, manageable parts. This is particularly useful for large projects with numerous dependencies and configurations.

## Getting started

### Build

To build this example, use

```
bazel build //...
```

If the build is successful, Bazel prints the output similar to

```
WARNING: --enable_bzlmod is set, but no MODULE.bazel file was found at the workspace root. Bazel will create an empty MODULE.bazel file. Please consider migrating your external dependencies from WORKSPACE to MODULE.bazel. For more details, please refer to https://github.com/bazelbuild/bazel/issues/18958.
INFO: Analyzed 4 targets (90 packages loaded, 521 targets configured).
INFO: Found 4 targets...
INFO: Elapsed time: 3.293s, Critical Path: 1.18s
INFO: 47 processes: 22 internal, 25 darwin-sandbox.
INFO: Build completed successfully, 47 total actions
```

### Test

To build this example, use

```
bazel test //...
```

## Splitting `WORKSPACE` File

### 1. Create a Directory for External Dependencies

First, create a directory to store your external dependency files. A common convention is to use a directory named dependencies. In this case we named third_party. One thing to note is that there must be a `BUILD.bazel` file in this directory as well.

### 2. Move Dependencies to Separate Files

Move the dependency declarations from your `WORKSPACE` file to separate files in the dependencies directory. For example, create a file named `stage06_deps.bzl`. See `stage06_deps.bzl` file.

### 3. Load Dependencies in `WORKSPACE`

In your `WORKSPACE` file, load the split dependency files using the `load` function.

```
load("//third_party:stage06_deps.bzl", "stage06_deps")

stage06_deps()
```

## Wrap `http_archive` with `maybe`

The code snippet provided is a practical way to ensure that the `http_archive` function is not declared multiple times in a Bazel project:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# Wrap http_archive with maybe so we don't try to declare a dependency twice
def http_archive(**kwargs):
    maybe(_http_archive, **kwargs)
```

### Explanation

Loading `http_archive` and `maybe`:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", _http_archive = "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
```

This loads the `http_archive` function from Bazel's built-in repository rules and assigns it to `_http_archive`.
It also loads the `maybe` function from the `utils.bzl` file. The `maybe` function is used to conditionally call another function based on whether certain conditions are met, such as whether a rule already exists.

Defining a Wrapped `http_archive` Function:

```
def http_archive(**kwargs):
    maybe(_http_archive, **kwargs)
````

This defines a new function `http_archive` that wraps the original `_http_archive` function with the maybe function.
The `maybe` function checks whether the rule already exists and only calls `_http_archive` if it does not.

### Purpose

Avoiding Duplicate Declarations: By wrapping `http_archive` with `maybe`, we ensure that the `http_archive` rule is only declared if it hasn't been declared already. This prevents potential conflicts and errors that can arise from trying to declare the same dependency multiple times.

### Use Case

This pattern is particularly useful in large Bazel projects with many dependencies managed across multiple files. It helps maintain clean and conflict-free dependency declarations.

### Example Scenario

Assume you have a `WORKSPACE` file with several dependencies, and some of them might be included in different files. Using this wrapper, you can safely include dependencies without worrying about whether they have been declared elsewhere.

```
# In WORKSPACE or another .bzl file
http_archive(
    name = "example_dependency",
    urls = ["https://example.com/example_dependency.tar.gz"],
    sha256 = "examplechecksum",
)

# Including the dependency again in another file will not cause a conflict
load("//:dependencies.bzl", "http_archive")

http_archive(
    name = "example_dependency",
    urls = ["https://example.com/example_dependency.tar.gz"],
    sha256 = "examplechecksum",
)
````

In this setup, the second declaration will be ignored if the example_dependency has already been declared, thanks to the `maybe` wrapper. This ensures that your Bazel setup remains robust and free of redundant dependency declarations.