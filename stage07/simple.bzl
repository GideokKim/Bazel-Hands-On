"""Simple example of rules that does nothing."""


# These functions are called when the rules are analyzed.
# You may use print for debugging.
def _simple_impl(_):
    # This function doesn't do anything.
    print("This rule does nothing")

def _simple2_impl(ctx):
    # This function prints the passed message.
    print(ctx.attr.message)

    # This function prints the label of this rule.
    print(ctx.label)
    print("This rule's label is " + str(ctx.label))

simple = rule(implementation = _simple_impl)

simple2 = rule(
    implementation = _simple2_impl,
    attrs = {
        "message": attr.string(mandatory = True)
    }
)
