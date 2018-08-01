# Git
bind-key G send-keys ". ~/.dotfiles/tmux/bindings/gitcommit.bind" Enter
bind -T copy-mode Enter send-keys -X copy-pipe-and-cancel "pbcopy"