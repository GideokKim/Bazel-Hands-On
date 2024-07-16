# Stage 08

This guide defines a Bazel rule that accesses and prints its attributes, providing detailed debug information.

## Getting started

### Build

To build this example, use

```shell
bazel build //...
```

or

```shell
bazel build //:other
bazel build //:some_target
```

If the build is successful, Bazel prints the output similar to

![image](/stage08/img/bazel-hands-on-stage08.png)

## Add attributes

In Bazel, we can define custom attributes for our rules using the `attrs` dictionary. These attributes allow us to pass specific values to the rule's implementation function. Here is how we can define and use custom attributes:

```python
printer = rule(
    implementation = _impl,
    attrs = {
        # Do not declare "name": It is added automatically.
        "user_defined_number": attr.int(default = 1),
        "deps": attr.label_list(allow_files = True),
    },
)
```
