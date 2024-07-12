# Stage 02

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
INFO: Analyzed 2 targets (83 packages loaded, 392 targets configured).
INFO: Found 2 targets...
INFO: Elapsed time: 0.243s, Critical Path: 0.10s
INFO: 12 processes: 7 internal, 5 linux-sandbox.
INFO: Build completed successfully, 12 total actions
```

### Run

To build this example, use

```
bazel run //main:hello-world
```

If the build is successful, Bazel prints the output similar to

```
INFO: Analyzed target //main:hello-world (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //main:hello-world up-to-date:
  bazel-bin/main/hello-world
INFO: Elapsed time: 0.046s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Running command line: bazel-bin/main/hello-world
Hello world
Thu Jul 11 18:56:13 2024
```

If you enter the command below to run

```
bazel run //...
```

You will see an error message like this:

```
ERROR: Only a single target can be run. Your target pattern //... expanded to the targets //main:hello-greet, //main:hello-world
INFO: Elapsed time: 0.028s
INFO: 0 processes.
ERROR: Build did NOT complete successfully
ERROR: Build failed. Not running target
```

## `tags = ["manual"]`

The `tags = ["manual"]` line ensures that `bazel run //...` does not include this target in its execution, preventing cc_library targets from being run inadvertently.

To resolve the previous error, you can modify it as follows:

```
# BUILD.bazel

cc_library( # rule function
    # inputs
    name = "hello-greet", # target name
    srcs = ["hello-greet.cc"],
    hdrs = ["hello-greet.h"],
    tags = ["manual"],
)
```

## Packages

A package is defined as a directory containing a `BUILD` file named either `BUILD` or `BUILD.bazel`. Packages are the unit of granularity for deciding whether or not to allow access.

The primary unit of code organization in a repository is the package. A package is a collection of related files and a specification of how they can be used to produce output artifacts.

For example, in the following directory tree there are two packages, `my/app`, and the subpackage `my/app/tests`. Note that `my/app/data` is not a package, but a directory belonging to package `my/app`.

```
src/my/app/BUILD
src/my/app/app.cc
src/my/app/data/input.txt
src/my/app/tests/BUILD
src/my/app/tests/test.cc
```

## Targets

A package is a container of targets, which are defined in the package's `BUILD` file. Most targets are one of two principal kinds, files and rules.

## Labels

A label is an identifier for a target. A typical label in its full canonical form looks like:

```
//package-name:target-name
```

### External repository

```
@myrepo//my/app/main:app_binary
```

### Same repository

```
//my/app/main:app_binary
```

When the label refers to the same package it is used in, the package name (and optionally, the colon) may be omitted. So this label may be written either of the following ways:

```
app_binary
:app_binary
```

## `cc_binary` rule

### Arguments

1. `deps`: Dependencies required to build the binary, such as libraries defined in other targets.

## `cc_library` rule

Use `cc_library()` for C++-compiled libraries.

### Arguments

1. `hdrs`: For `cc_library` rules, headers in `hdrs` comprise the public interface of the library and can be directly included both from the files in `hdrs` and `srcs` of the library itself as well as from files in `hdrs` and `srcs` of `cc_*` rules that list the library in their `deps`.

## Dependencies

![image](/stage02/img/bazel-hands-on-stage2.png)
