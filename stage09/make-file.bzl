"""Generate a file.

In this example, the content is passed via an attribute. If you generate
large files with a lot of static content, consider using
`ctx.actions.expand_template` instead.
"""

def user_defined_file(**kwargs):
    _user_defined_file_rule(out = "{name}.txt".format(**kwargs), **kwargs)

def _impl(ctx):
    output = ctx.outputs.out
    content = "content : " + ctx.attr.content + "username : " + ctx.attr.username
    ctx.actions.write(output = output, content = content)

_user_defined_file_rule = rule(
    implementation = _impl,
    attrs = {
        "content": attr.string(),
        "username": attr.string(),
        "out": attr.output()},
)
