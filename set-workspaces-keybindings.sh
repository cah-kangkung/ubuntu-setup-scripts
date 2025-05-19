#!/bin/bash

echo "✔ Setting up 9 static workspaces..."
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9

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

# Workspace navigation with h/l instead of Left/Right
echo "✅ Binding Ctrl+Super+H to switch to the left workspace"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>h']"

echo "✅ Binding Ctrl+Super+L to switch to the right workspace"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>l']"

# Move window to workspace left/right using H/L
echo "✅ Binding Ctrl+Shift+Super+H to move window to the left workspace"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Control><Shift><Super>h']"

echo "✅ Binding Ctrl+Shift+Super+L to move window to the right workspace"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Control><Shift><Super>l']"

# Unbind and rebind other custom keys
echo "⛔ Unbinding Super+H (minimize)"
gsettings set org.gnome.desktop.wm.keybindings minimize "[]"

echo "⛔ Unbinding Super+L (lock screen / screensaver)"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "[]"

echo "✅ Binding Ctrl+Shift+Super+L to lock screen"
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Control><Alt><Super>l']"

echo "⛔ Unbinding Super+V (toggle message tray)"
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"

echo "✅ Binding Gnome Terminal Tab Switching"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

echo "🎉 Done! Workspace keys, system shortcuts, and custom keybindings are now configured."