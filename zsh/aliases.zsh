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
alias ainstall="sudo apt-get install"
alias mit="be rails db:migrate RAILS_ENV=test"
alias mid="be rails db:migrate"
alias dbreset="be rails db:reset"
alias testdbreset="be rails db:reset RAILS_ENV=test"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

function prspec() {
    echo Creating...
    bundle exec rake parallel:create > /dev/null 2>&1
    echo Preparing...
    bundle exec rake parallel:prepare > /dev/null 2>&1
    echo Running...
    REGEX='spec/(?!features)'
    bundle exec parallel_rspec spec -n 4 -p $REGEX
}

die () {
    echo >&2 "$@"
    exit 1
}

function chromego() {
    echo loading chrome with $1
    chrome $1 &
}

function fixup() {
    if [ -z "$1" ] 
    then 
        echo "1 argument required, $# provided"
    else
        echo Fixuping to $1
        git commit --fixup=$1
    fi
}

function list_all() {
    emulate -L zsh
    clear
    ls -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")