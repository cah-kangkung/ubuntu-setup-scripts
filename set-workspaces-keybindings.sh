#!/bin/bash

echo "✔ Setting up 9 static workspaces..."
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

# Unbind tiling shortcuts (Left, Right, Up, Down)
echo "⛔ Unbinding directional tiling shortcuts..."

directions=("left" "right" "up" "down")
for dir in "${directions[@]}"; do
  gsettings set org.gnome.mutter.keybindings toggle-tiled-${dir} "[]"
  gsettings set org.gnome.shell.extensions.tiling-assistant tile-${dir}-half "[]"
done

# Loop over 1 to 9 for workspace switching and moving windows
for i in {1..9}; do
  echo "⛔ Unbinding Super+$i from application switching..."
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
  gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-$i "[]"

  echo "✅ Binding Super+$i to switch to workspace $i"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"

  echo "✅ Binding Shift+Super+$i to move window to workspace $i"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

# Bind Ctrl+Super+Left/Right to switch workspaces
echo "✅ Binding Ctrl+Super+Left to switch to the left workspace"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>Left']"

echo "✅ Binding Ctrl+Super+Right to switch to the right workspace"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>Right']"

# Bind Ctrl+Shift+Super+Left/Right to move windows to the left or right workspace
echo "✅ Binding Ctrl+Shift+Super+Left to move window to the left workspace"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Super>Left']"

echo "✅ Binding Ctrl+Shift+Super+Right to move window to the right workspace"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Super>Right']"

echo "🎉 Done! Workspaces, shortcuts, and tiling settings are all configured."

