# Stage 01

This showcases how to build a single file to create a runnable application.

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
