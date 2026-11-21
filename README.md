# dotfiles

Non-interactive POSIX bootstrap for [GitHub Codespaces](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles) and Ubuntu/WSL2 containers.

## What `install.sh` configures

1. Appends `[include]` for `~/.gitconfig.shared` into `~/.gitconfig` without overwriting Codespaces GPG commit-signing or credential helper settings.
2. Sources `~/.aliases` from `~/.bashrc` and `~/.zshrc` idempotently.
3. Configures `~/.editorconfig` defaults (`utf-8`, `lf`, 2-space YAML/JSON/TS/JS indentation, 4-space Python indentation).
4. Contains zero secrets, tokens, or hardcoded personal email addresses.

## Activate in GitHub Codespaces

Open `https://github.com/settings/codespaces`, check `Automatically install dotfiles`, and select `Krosebrook/dotfiles`.
