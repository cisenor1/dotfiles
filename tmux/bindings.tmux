# Git
bind-key G send-keys ". ~/.dotfiles/tmux/bindings/gitcommit.bind" Enter
bind -T copy-mode Enter send-keys -X copy-pipe-and-cancel "pbcopy"
bind-key Tab next-window
bind-key q send-keys "exit" Enter