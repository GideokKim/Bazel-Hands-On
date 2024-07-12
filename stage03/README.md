# Stage 03

In this stage we step it up and showcase how to integrate multiple `cc_library` targets from different packages.

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
INFO: Analyzed 3 targets (85 packages loaded, 395 targets configured).
INFO: Found 3 targets...
INFO: Elapsed time: 0.344s, Critical Path: 0.10s
INFO: 17 processes: 9 internal, 8 linux-sandbox.
INFO: Build completed successfully, 17 total actions
```

### run

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
INFO: Elapsed time: 0.033s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
INFO: Running command line: bazel-bin/main/hello-world
Hello world
Fri Jul 12 13:23:10 2024
```

## `visibility` attribute

Below, we see a similar configuration from Stage 2, except that this `BUILD` file is in a subdirectory called lib. In Bazel, subdirectories containing `BUILD` files are known as packages. The new property `visibility` will tell Bazel which package(s) can reference this target, in this case the `//main` package can use `hello-time` library.

```
cc_library(
    name = "hello-time",
    srcs = ["hello-time.cc"],
    hdrs = ["hello-time.h"],
    visibility = ["//main:__pkg__"],
)
```

To use our `hello-time` library, an extra dependency is added in the form of //path/to/package:target_name, in this case, it's `//lib:hello-time`

```
cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    deps = [
        ":hello-greet",
        "//lib:hello-time",
    ],
)
```

### Visibility specifications

1. `"//visibility:public"`: Grants access to all packages. (May not be combined with any other specification.)
2. `"//visibility:private"`: Does not grant any additional access; only targets in this package can use this target. (May not be combined with any other specification.)
3. `"//main:__pkg__"`: Grants access to `//main` (but not its subpackages).
4. `"//main:__subpackages__"`: Grants access `//main` and all of its direct and indirect subpackages.(sets the visibility so that all targets in the main package and its subpackages can depend on this target.)
