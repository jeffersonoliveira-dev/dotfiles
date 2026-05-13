-- Unifies Ctrl+h/j/k/l between Neovim windows and tmux panes (requires ../tmux/tmux.conf).
vim.g.tmux_navigator_disable_when_zoomed = 1
vim.cmd.packadd("vim-tmux-navigator")
