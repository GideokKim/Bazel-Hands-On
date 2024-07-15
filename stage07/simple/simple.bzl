"""Simple example of a rule that does nothing."""

def _simple_impl(_):
    # This function is called when the rule is analyzed.
    # You may use print for debugging.
    # buildifier: disable=print
    print("This rule does nothing")

simple = rule(implementation = _simple_impl)