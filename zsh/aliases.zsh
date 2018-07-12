echo Adding aliases...
alias reload!='. ~/.zshrc'

# ls
alias ls="ls"
alias la="ls -la"
alias ll="ls -l"

alias cls='clear' # Good 'ol Clear Screen command

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias be="bundle exec"
alias yb="yarn build"
alias c.="code ."
alias cls="clear"
alias justart="tmuxinator start juulio"
alias justop="tmuxinator stop juulio"
alias rmrf="rm -rf"

function list_all() {
    emulate -L zsh
    clear
    ls -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")