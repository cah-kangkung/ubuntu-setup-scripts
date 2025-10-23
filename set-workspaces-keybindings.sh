#!/bin/bash

echo "✔ Setting up 9 static workspaces..."
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 12

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

# additional workspaces
echo "✅ Binding Super+0 to switch to workspace 10"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 "['<Super>0']"

echo "✅ Binding Shift+Super+0 to move window to workspace 10"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 "['<Shift><Super>0']"

echo "✅ Binding Super+'-' to switch to workspace 11"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-11 "['<Super>Minus']"

echo "✅ Binding Shift+Super+'-' to move window to workspace 11"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-11 "['<Shift><Super>Minus']"

echo "✅ Binding Super+'+' to switch to workspace 12"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-12 "['<Super>Plus']"

echo "✅ Binding Shift+Super+'+' to move window to workspace 12"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-12 "['<Shift><Super>Plus']"

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

echo "⛔ Unbinding Super+V (toggle message tray)"
gsettings set org.gnome.shell.keybindings toggle-message-tray "['<Super>m']"

echo "✅ Binding Gnome Terminal Tab Switching"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'

echo "✅ Set window switcher to all workspace"
gsettings set org.gnome.shell.window-switcher current-workspace-only false

# Bind Clipbiard Inidcator
echo "✅ Enable keybindings"
dconf write /org/gnome/shell/extensions/clipboard-indicator/enable-keybindings true

echo "✅ Enable Paste on Select"
dconf write /org/gnome/shell/extensions/clipboard-indicator/paste-on-select true

echo "✅ Bind Shift+V to toggle-menu"
dconf write /org/gnome/shell/extensions/clipboard-indicator/toggle-menu "['<Super>V']"

# Forge
echo "✅ Unbind Shift+Period from tiling shortcuts to make room for Emoji Picker toggle-menu shortcut"
dconf write /org/gnome/shell/extensions/forge/keybindings/prefs-open "@as []"

echo "🎉 Done! Workspace keys, system shortcuts, and custom keybindings are now configured."