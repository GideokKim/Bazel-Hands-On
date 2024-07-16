# Stage 09

This Bazel rule generates a file with content specified via an attribute. The example demonstrates how to define a custom rule that writes content to an output file. If the file contains a lot of static content, the `ctx.actions.expand_template` method is recommended for efficiency.

## Getting started

### Build

To build this example, use

```shell
bazel build //...
```

or

```shell
bazel build //:hello
```

If the build is successful, Bazel prints the output similar to

```shell
INFO: Analyzed target //:hello (5 packages loaded, 8 targets configured).
INFO: Found 1 target...
Target //:hello up-to-date:
  bazel-bin/hello.txt
INFO: Elapsed time: 0.205s, Critical Path: 0.00s
INFO: 2 processes: 2 internal.
INFO: Build completed successfully, 2 total actions
```

We can view the `hello.txt` file created in the `bazel-bin` directory.

## `ctx.actions.write()` function

Creates a file write action. When the action is executed, it will write the given content to a file. This is used to generate files using information available in the analysis phase.

## `attr`

This is a top-level module for defining the attribute schemas of a rule. Each function returns an object representing the schema of a single attribute. These objects are used as the values of the attrs dictionary argument of `rule()`.

### `attr.string()`

The `attr.string()` function creates a string attribute. This attribute can be used to pass textual data to the rule's implementation function.

### `attr.output()`

The `attr.output()` function is used to define an output file attribute for a custom rule. It allows the rule to specify which files will be generated as outputs. This is essential for rules that create files as part of their operation, enabling Bazel to manage and track the outputs correctly.
