#!/usr/bin/env bash

set -e

EXTENSIONS=(
  "forge@jmmaranan.com"
  "space-bar@luchrioh"
  "clipboard-indicator@tudmotu.com"
  "emoji-copy@felipeftn"
)

INSTALLER="$HOME/.local/bin/gnome-shell-extension-installer"

echo "Checking installer..."

if ! command -v gnome-shell-extension-installer &> /dev/null; then
  echo "Installing gnome-shell-extension-installer..."

  mkdir -p "$HOME/.local/bin"

  curl -L \
    https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer \
    -o "$INSTALLER"

  chmod +x "$INSTALLER"

  export PATH="$HOME/.local/bin:$PATH"
fi

echo "Installing GNOME Shell extensions..."

for ext in "${EXTENSIONS[@]}"; do
  echo "Installing $ext..."
  gnome-shell-extension-installer "$ext" --yes || echo "Failed to install $ext"
done

echo "Enabling extensions..."

for ext in "${EXTENSIONS[@]}"; do
  echo "Enabling $ext..."
  gnome-extensions enable "$ext" || echo "Failed to enable $ext"
done

echo "Loading dconf backup..."
dconf load / < dconf-backup.conf

echo "All done!"
