# Stage 01

This showcases how to build a single file to create a runnable application.

## Getting started

### Build

To build this example, use

```
bazel build //main:hello-world
```

or

```
bazel build //...
```

If the build is successful, Bazel prints the output similar to

```
INFO: Analyzed target //main:hello-world (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //main:hello-world up-to-date:
  bazel-bin/main/hello-world
INFO: Elapsed time: 0.147s, Critical Path: 0.10s
INFO: 3 processes: 1 internal, 2 linux-sandbox.
INFO: Build completed successfully, 3 total actions
```

### Run

To build this example, use

```
bazel run //main:hello-world
```

or

```
bazel run //...
```

If the build is successful, Bazel prints the output similar to

```
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

## BUILD File

A `BUILD` file is the main configuration file that tells Bazel what software outputs to build, what their dependencies are, and how to build them. Bazel takes a `BUILD` file as input and uses the file to create a graph of dependencies and to derive the actions that must be completed to build intermediate and final software outputs. The file can also be named `BUILD.bazel`.

This BUILD.bazel file in Stage 01 shows that we want to build a C++ binary using the cc_binary rule provided by Bazel. In the cc_binary rule, name of the binary is specified in name attribute (in this example, it's hello-world), required source files to be built are provided in srcs attribute.

```
cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
)
```

## WORKSPACE

The `WORKSPACE` file in Bazel defines the root directory of a Bazel project. It is used to set up external dependencies and configure the overall build environment. Key components typically found in a `WORKSPACE` file include:

- `External Repository Rules`: Rules like http_archive, git_repository, and local_repository to fetch and use external code.
- `Load Statements`: Load custom macros and functions for better organization and reuse.
- `Dependency Management`: Specify third-party libraries and modules your project depends on.
For a detailed example, visit Bazel Documentation.

In Stage 01, it is used only to define the root directory and is left as an empty file.

## `load()` statement

```
load("@rules_cc//cc:defs.bzl", "cc_binary")
```

Bazel extensions are files ending in `.bzl`. Use the load statement to import a symbol from an extension. This code loads the file `@rules_cc//cc:defs.bzl` and adds the `cc_binary` symbol to the environment. This can be used to load new rules, functions, or constants (for example, a string or a list).

The [`@rules_cc//cc:defs.bzl` file](https://github.com/bazelbuild/rules_cc/blob/main/cc/defs.bzl) is part of the [rules_cc repository](https://github.com/bazelbuild/rules_cc), which provides Bazel rules for compiling C and C++ code. This file typically contains definitions and macros for configuring and building C/C++ targets within a [Bazel project](https://github.com/bazelbuild).
