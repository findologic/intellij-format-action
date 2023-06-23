# IntelliJ IDEA formatter action

Runs the formatter on code to auto-fix style, or enforce it.

## Inputs

### `include-glob`

Pattern for files to include in the formatting, e.g. `*.java,*.kt`. Default: `*`.

### `path`

Root path from which files to format are searched recursively. Must be relative to the workspace.
Default: `.`.

### `fail-on-changes`

Causes the action to fail upon detecting files changed by running the formatter if set to `true`.
Default: `false`.

### `auto-fix`

If true, the action create a commit with the formatted code.
Default: `false`.

## Outputs

### `files-changed`

Zero if none changed, greater if at least one file changed.

## Example usage

```yaml
uses: jacopocarlini/intellij-format-action@v1.2.0
with:
  include-glob: '*.kt,*.java'
  path: .
  fail-on-changes: false
  auto-fix: true
```
