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

## `workspace()` statement

```
workspace(name = "bazel_hands_on_stage04")
```

The workspace statement is used at the beginning of a Bazel `WORKSPACE` file to define the name of the workspace. This is optional but can be useful for distinguishing between different Bazel projects, especially when dealing with external dependencies.

By setting the workspace name in the `WORKSPACE` file, we can create dependencies from the outside using the `@` keyword. See [GoogleTest WORKSPACE](https://github.com/google/googletest/blob/b4aaf97d8f7eaffab79aa15e10a91b331b941fe2/WORKSPACE#L1)

### Arguments

1. `name`: The argument to specify the name of your workspace, in this case, "bazel_hands_on_stage04".

## `http_archive()`

http_archive is a Bazel repository rule used to fetch and extract an archive from a URL. It is often used to manage external dependencies by downloading their source code during the build process.

### Arguments

1. `name`: The name of the external repository.
2. `urls`: List of URLs to download the archive from.
3. `sha256`: SHA-256 hash of the archive to verify its integrity.
4. `strip_prefix`: Removes the specified directory prefix from the extracted files.
5. `build_file` / `build_file_content`: Specifies a `BUILD` file to use for the extracted files.

## `cc_test` rule

The `cc_test` rule in Bazel is used to define and run C++ test targets. It is similar to `cc_binary` but is specifically intended for tests, providing better integration with Bazel's testing framework.

### Arguments

1. `name`: The name of the test target.
2. `srcs`: A list of source files to compile.
3. `hdrs`: A list of header files.
4. `deps`: Dependencies required by the test.
5. `data`: Additional data files needed for the test.
6. `args`: Command-line arguments passed to the test executable.
