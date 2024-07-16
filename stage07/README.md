# Stage 07

This guide provides two simple rules defined in Bazel. The first rule does nothing, the second rule outputs the forwarded message. This is simple examples showing how to define and use Bazel rules.

## Getting started

### Build

To build this example, use

```shell
bazel build //...
```

or

```shell
bazel build //:nothing
bazel build //:debug-message
```

If the build is successful, Bazel prints the output similar to

![image](/stage07/img/bazel-hands-on-stage07.png)

## `rule` function

The `rule` function in Bazel is used to define a new build rule. This function specifies how the rule should behave, what attributes it should have, what files it should generate, and more.

## `ctx` object

The `ctx` (short for context) object is a crucial part of the rule implementation function. It provides access to various aspects of the build environment and the attributes of the rule. The `ctx` object is passed as an argument to the implementation function of a Bazel rule. It acts as the interface between the rule's implementation and the Bazel build system, allowing the rule to interact with the build environment, access input files, create output files, define actions, and more.

### Components of `ctx`

#### Attributes (`ctx.attr`)

Access the attributes defined in the attrs dictionary of the rule.

#### Workspace Information (`ctx.workspace_name`, `ctx.label`)

Access metadata about the workspace and the rule's label(`ctx.label` provides the label of the target being built).

## The simple rules

### 1. `_simple_impl(_)` function

This function is called when the simple rule is analyzed. It takes one argument (`_` can be used to indicate that there are no arguments), which is not used. It prints `"This rule does nothing"` for debugging purposes.

### 2. `simple` rule

The simple rule is created using the rule function with `_simple_impl` as its implementation. This rule does nothing and is used primarily as a basic example.

### 3. `_simple2_impl(ctx)` function

This function is called when the simple2 rule is analyzed. It takes one argument, ctx, which stands for context and provides access to the rule's attributes and other information. It prints the value of the message attribute for debugging purposes.

### 4. `simple2` rule

The simple2 rule is created using the rule function with `_simple2_impl` as its implementation. The rule includes an attrs dictionary that defines the attributes the rule will accept. The message attribute is defined as a string and is mandatory, meaning it must be provided when the rule is used.
