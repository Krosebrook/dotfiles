#!/usr/bin/env bash
# Idempotent, non-interactive bootstrap invoked automatically by GitHub Codespaces.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_HOME="${HOME:?HOME must be set}"

cp "${DOTFILES_DIR}/.gitconfig.shared" "${TARGET_HOME}/.gitconfig.shared"
cp "${DOTFILES_DIR}/.aliases" "${TARGET_HOME}/.aliases"

if [[ ! -f "${TARGET_HOME}/.editorconfig" ]]; then
  cp "${DOTFILES_DIR}/.editorconfig" "${TARGET_HOME}/.editorconfig"
fi

if ! git config --global --get-all include.path 2>/dev/null | grep -Fxq "${TARGET_HOME}/.gitconfig.shared"; then
  git config --global --add include.path "${TARGET_HOME}/.gitconfig.shared"
fi

SOURCE_LINE='[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"'
for rc in "${TARGET_HOME}/.bashrc" "${TARGET_HOME}/.zshrc"; do
  touch "${rc}"
  if ! grep -Fqx "${SOURCE_LINE}" "${rc}"; then
    printf '\n# Krosebrook dotfiles aliases\n%s\n' "${SOURCE_LINE}" >> "${rc}"
  fi
done

echo "dotfiles bootstrap complete for ${TARGET_HOME}"
