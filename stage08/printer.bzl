"""Example of a rule that accesses its attributes."""

def _impl(ctx):
    # Print debug information about the target.
    print("\t****************************************************")
    print("\t userdefined_number = {}".format(ctx.attr.user_defined_number))
    print("\tTarget {} has {} deps".format(ctx.label, len(ctx.attr.deps)))

    # For each target in deps, print its label and files.
    for i, d in enumerate(ctx.attr.deps):
        print("\t{}. label = {}".format(i + 1, d.label))

        # A label can represent any number of files (possibly 0).
        print("    files = " + str([f.path for f in d.files.to_list()]))

    # For debugging, consider using `dir` to explore the existing fields.
    print("\t--------------------ctx  members--------------------")
    # print(dir(ctx))  # prints all the fields and methods of ctx
    for field in dir(ctx):
        print("\t{}".format(str(field)))
    print("\t--------------------ctx.attr members----------------")
    # print(dir(ctx.attr))  # prints all the attributes of the rule
    for field in dir(ctx.attr):
        print("\t{}".format(str(field)))
    print("\t****************************************************\n\n")

printer = rule(
    implementation = _impl,
    attrs = {
        # Do not declare "name": It is added automatically.
        "user_defined_number": attr.int(default = 1),
        "deps": attr.label_list(allow_files = True),
    },
)
