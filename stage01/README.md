# Stage 01

Here we show how to build a single file to produce an executable application.

## Getting started

### Build

To build this example, use

```shell
bazel build //main:hello-world
```

or

```shell
bazel build //...
```

If the build is successful, Bazel prints an output similar to

```shell
INFO: Analyzed target //main:hello-world (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //main:hello-world up-to-date:
  bazel-bin/main/hello-world
INFO: Elapsed time: 0.147s, Critical Path: 0.10s
INFO: 3 processes: 1 internal, 2 linux-sandbox.
INFO: Build completed successfully, 3 total actions
```

### Run

To run this example, use

```shell
bazel run //main:hello-world
```

or

```shell
bazel run //...
```

If the build is successful, Bazel prints an output similar to

```shell
INFO: Analyzed target //main:hello-world (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //main:hello-world up-to-date:
  bazel-bin/main/hello-world
INFO: Elapsed time: 0.062s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Running command line: bazel-bin/main/hello-world
Hello world
Thu Jul 11 18:07:29 2024
```

## WORKSPACE

The `WORKSPACE` file in Bazel defines the root directory of a Bazel project. It is used to set up external dependencies and configure the overall build environment. Key components typically found in a `WORKSPACE` file include:

- `External Repository Rules`: Fetches and uses external code. Examples include `http_archive`, `git_repository`, and `local_repository`.
- `Load Statements`: Loads custom macros and functions for better organization and reuse.
- `Dependency Management`: Specifies third-party libraries and modules your project depends on.

In Stage 01, the `WORKSPACE` file is only used to define the root directory and is left empty.

## `load()` statement

```shell
load("@rules_cc//cc:defs.bzl", "cc_binary")
```

Bazel extensions are files ending in `.bzl`. Use the load statement to import a symbol from an extension. This code loads the file `@rules_cc//cc:defs.bzl` and adds the `cc_binary` symbol to the environment. This can be used to load new rules, functions, or constants.

The [`@rules_cc//cc:defs.bzl` file](https://github.com/bazelbuild/rules_cc/blob/main/cc/defs.bzl) is part of the [rules_cc repository](https://github.com/bazelbuild/rules_cc), which provides Bazel rules for compiling C and C++ code. This file typically contains definitions and macros for configuring and building C/C++ targets within a [Bazel project](https://github.com/bazelbuild).

## BUILD File

A `BUILD` file is the main configuration file that tells Bazel what software outputs to build, what their dependencies are, and how to build them. Bazel takes a `BUILD` file as input and uses the file to create a graph of dependencies and to derive the actions that must be completed to build intermediate and final software outputs. The file can be named `BUILD` or `BUILD.bazel`.

### `cc_binary` rule (1)

The `BUILD.bazel` file in Stage 01 shows that we want to build an executable C++ binary using the `cc_binary` rule provided by Bazel. 

```python
cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
)
```

#### Arguments

1. `name`: The name of the binary target. This target name must be unique.
2. `srcs`: A list of source files to compile. These source files typically include `.cc` (C++ source files), `.c` (C source files), and other files that are directly compiled into the binary.
