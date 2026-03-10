# README

## DCONF Settings

### Backup

`dconf dump / > ~/dconf-backup.conf`

### Restore

`cp -r gnome-shell ~/.local/share/`
`dconf load / < dconf-backup.conf`
