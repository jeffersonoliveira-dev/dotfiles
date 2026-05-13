# tmux

The live config is **`~/.tmux.conf`**. This folder mirrors it for the dotfiles repo (copy or symlink as you prefer).

## Install

```bash
sudo pacman -S tmux
```

## TPM (first time only)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux, press `Prefix + I` (capital **I**) once to install plugins (`tpm`, sensible, resurrect, continuum, vim-tmux-navigator).

## Neovim

- **Ctrl+h/j/k/l** — shared between Neovim splits and tmux panes via [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) (TPM on tmux + `plugins/tmux_navigator.lua` in Neovim).
- **`focus-events`**, **`escape-time 0`**, **RGB terminal features** — help autoread, keys, and truecolor themes.

## Look (Kitty One Dark + Neovim)

Status bar is **bottom**, colours taken from `~/.config/kitty/kitty.conf` (One Dark + cursor `#528bff`). Powerline glyphs `` `` `` need a **Nerd Font** in the terminal (e.g. JetBrainsMono Nerd Font in Kitty).

## Reload

Inside tmux: **`Prefix + r`** (`Ctrl+a` then `r`).

## Auto-start tmux in every terminal

`~/.zshrc` runs **`exec tmux new-session -As main`** before the rest of the config when:

- the shell is **interactive**,
- **`$TMUX` is unset** (not already inside tmux),
- **`tmux` is on `PATH`**,
- **`TERM_PROGRAM` is not `vscode`** (integrated terminal).

Use a plain shell once: **`SKIP_TMUX=1 zsh`**. To always skip in a given app terminal, set `SKIP_TMUX=1` in that profile.

Session name **`main`** matches `new-session -As main` (create if missing, else attach). Multiple terminal windows **share** the same session unless you create another (e.g. `tmux new -s work`).

## Pure X11 (no `wl-copy`)

Edit `~/.tmux.conf` copy-mode bindings and use:

```tmux
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"
```
