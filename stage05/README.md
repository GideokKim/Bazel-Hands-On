# Stage 05

In this stage we step it up and showcase how to resolve WARNING.

```
WARNING: --enable_bzlmod is set, but no MODULE.bazel file was found at the workspace root. Bazel will create an empty MODULE.bazel file. Please consider migrating your external dependencies from WORKSPACE to MODULE.bazel. For more details, please refer to https://github.com/bazelbuild/bazel/issues/18958.
```

## Getting started

### Build

To build this example, use

```
bazel build //...
```

If the build is successful, Bazel prints the output similar to

```
INFO: Analyzed 4 targets (57 packages loaded, 326 targets configured).
INFO: Found 4 targets...
INFO: Elapsed time: 1.666s, Critical Path: 1.34s
INFO: 45 processes: 18 internal, 27 linux-sandbox.
INFO: Build completed successfully, 45 total actions
```

### Test

To build this example, use

```
bazel test //...
```

If the test is successful, Bazel prints the output similar to

![image](/stage05/img/bazel-hands-on-stage05.png)

## Bazel modules

A Bazel module is a Bazel project that can have multiple versions, each of which publishes metadata about other modules that it depends on.

A module must have a `MODULE.bazel` file at its repo root. This file is the module's manifest, declaring its name, version, list of direct dependencies, and other information. For a basic example:

```
module(name = "my-module", version = "1.0")

bazel_dep(name = "rules_cc", version = "0.0.1")
bazel_dep(name = "protobuf", version = "3.19.0")
```

## `MODULE.bazel.lock` file

The `MODULE.bazel.lock` file is an auto-generated file used in Bazel's Bzlmod system to lock the dependency versions and their resolutions. It ensures that every build uses the exact same versions of dependencies, providing consistency and reproducibility across different environments.

## `module` function

The `module` function in `MODULE.bazel` is used to define the module itself, including its name and version. This is the starting point for setting up a Bazel module. It should be called at most once, and if called, it must be the very first directive in the MODULE.bazel file.

### Arguments

1. `name`: The name of the module. Can be omitted only if this module is the root module (as in, if it's not going to be depended on by another module).
2. `version`: The version of the module.
3. `compatibility_level`: The compatibility level of the module; this should be changed every time a major incompatible change is introduced.

## `bazel_dep` function

The `bazel_dep` function in `MODULE.bazel` is used to declare dependencies on other Bazel modules. It specifies the module name and version, allowing Bazel to fetch and use these dependencies in the build.

### Arguments

1. `name`: The name of the module you are depending on. If available, check the `MODULE.bazel` file in the external repository for the module name. See [Google Test module name](https://github.com/google/googletest/blob/b4aaf97d8f7eaffab79aa15e10a91b331b941fe2/MODULE.bazel#L33-L37).
2. `version`: The version of the module you want to use.
3. `repo_name`: The name of the external repo representing this dependency. This is by default the name of the module. In this example, Google Test was used as stage05_teset.

## Registry

A registry of Bazel's Bzlmod system is a repository that hosts metadata about Bazel modules, including their versions and dependencies. It serves as a centralized location where Bazel can fetch information about modules to resolve and download dependencies during the build process.

### Bazel Central Registry

The default Bazel registry for the Bzlmod external dependency system of Bazel. It is the recommended place to find and publish your favorite Bazel projects. Visit <https://registry.bazel.build> to check what modules are already available!
