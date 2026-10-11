# mmogr/tap

Homebrew formulae and casks for projects by [mmogr](https://github.com/mmogr).

```bash
brew tap mmogr/tap
```

| Install | What |
|---|---|
| `brew install mmogr/tap/gglib` | [gglib](https://github.com/mmogr/gglib) command-line tool (macOS on Apple silicon, Linux x86_64) |
| `brew install --cask mmogr/tap/gglib-gui` | gglib desktop app (macOS on Apple silicon) |

## How this repository is maintained

Nothing here is edited by hand. Each project's release workflow renders its
own files from templates in that project's repository and pushes them here
after a stable release is approved, writing only those files. To change a
formula or cask, edit its template upstream:

| Files | Source |
|---|---|
| `Formula/gglib.rb`, `Casks/gglib-gui.rb` | [`mmogr/gglib` `packaging/homebrew/`](https://github.com/mmogr/gglib/tree/main/packaging/homebrew) |
