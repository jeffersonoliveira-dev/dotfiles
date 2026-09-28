# Ghostty

Mirrors `~/.config/kitty/kitty.conf` (One Dark theme + keybinds).

Live paths:

- `~/.config/ghostty/config`
- `~/.config/ghostty/pick-pdf.sh` (fzf + Kitty graphics PDF viewers)
- `~/.config/ghostty/view-pdf.sh`

Reload in Ghostty: **Ctrl+Shift+,**

## Dead keys (`us/intl`, accents, `` ` ``, `~`, `"`)

GTK 4.20+ on Wayland needs an input method for dead keys. Ghostty uses:

```ini
# ~/.config/systemd/user/app-com.mitchellh.ghostty.service.d/override.conf
[Service]
Environment="GTK_IM_MODULE=simple"
```

Copy from `systemd-override.conf`, then `systemctl --user daemon-reload` and restart the Ghostty service.

## Differences from Kitty

| Kitty | Ghostty |
|-------|---------|
| Layouts stack/tall/fat | Splits (`equalize_splits`, `new_split`) — no 1:1 layout engine |
| `kitten choose_files` PDF picker | `pick-pdf.sh` with **fzf** (no keybind; run manually) |
| Tab bar fade style | `gtk-titlebar-style = tabs` (merged tab + title bar) |
| Native OS titlebar | `window-decoration = client` (Ghostty draws close/min/max) |
