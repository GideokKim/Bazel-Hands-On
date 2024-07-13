# Stage 04

In this stage we step it up and showcase how to use third party dependencies(also called external dependencies).

## Getting started

### Build

To build this example, use

```
bazel build //...
```

If the build is successful, Bazel prints the output similar to

```
WARNING: --enable_bzlmod is set, but no MODULE.bazel file was found at the workspace root. Bazel will create an empty MODULE.bazel file. Please consider migrating your external dependencies from WORKSPACE to MODULE.bazel. For more details, please refer to https://github.com/bazelbuild/bazel/issues/18958.
INFO: Analyzed 4 targets (88 packages loaded, 483 targets configured).
INFO: Found 4 targets...
INFO: Elapsed time: 3.488s, Critical Path: 1.31s
INFO: 45 processes: 18 internal, 27 linux-sandbox.
INFO: Build completed successfully, 45 total actions
```

The WARNING message may not appear depending on the Bazel version. This message will be resolved in Stage05.

### Test

To build this example, use

```
bazel test //...
```

If the test is successful, Bazel prints the output similar to

![image](/stage04/img/bazel-hands-on-stage04.png)
