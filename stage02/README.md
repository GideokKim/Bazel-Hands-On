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
