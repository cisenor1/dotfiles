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
alias rmrf="rm -rf"
alias ainstall="sudo apt-get install"
alias mit="be rails db:migrate RAILS_ENV=test"
alias mid="be rails db:migrate"
alias mux="tmuxinator"
alias rub="be rubocop -A"


function assh() {
  cd ~/repos/qa
  vagrant ssh
  popd
}

function brsp() {
	echo "in custom brsp"
	verbose=false
	while getopts "v:" opt; do
		case $opt in
			v)
				echo 'Got Verbose'
				verbose=true
				shift
				;;
		esac
	done
	if [ -f "./bin/rspec" ]
	then
		if verbose==true
		then
			echo "Found bin/rspec. Using that."
		fi
		bundle exec bin/rspec $1
	else
		if verbose==true
		then
			echo "Couldn't find bin/rspec. Using PATH instead."
		fi
		bundle exec rspec $1
	fi
}
function prspec() {
	TEST_ENV_NUMBER=6
	echo Creating...
	bundle exec rake parallel:create
	echo Preparing...
	bundle exec rake parallel:prepare
	echo Running...
	REGEX='spec/(?!features)'
	bundle exec parallel_rspec spec -n $TEST_ENV_NUMBER -p $REGEX
}

function qprspec(){
	TEST_ENV_NUMBER=12
	echo Running...
	REGEX='spec/(?!features)'
	bundle exec parallel_rspec spec -n $TEST_ENV_NUMBER -p $REGEX
}

function prassets(){
	bundle exec rake parallel:create
	bundle exec rake parallel:prepare
	REGEX='spec/features'
	bundle exec parallel_rspec spec -n 12 -p $REGEX
}

die () {
	echo >&2 "$@"
	exit 1
}

function update(){
	git checkout master
	git fapp
	be rails db:reset
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

function quickfix(){
	git add .
	fixup head
	git rmis
}

function list_all() {
	emulate -L zsh
	clear
	ls -a
}

function gfp {
	br=$(git branch --show-current)
	git push origin $br -f
}

function db_reset_all {
	bundle exec rake db:reset
	bundle exec rake db:reset RAILS_ENV=test
}
chpwd_functions=(${chpwd_functions[@]} "list_all")
