# Colors
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

function git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function hg_branch () {
    hg branch 2> /dev/null | awk '{print "(hg - " $1 ")"}'
}


PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\e[0;33m\]$(git_branch)$(hg_branch)\n\[\e[7:49:91m\]\[\e[0m\]$ '
export EVOLUXROOT=~/evolux
export EVOLUXNODEROOT=~/evolux-node
export edev="172.16.7.137"
alias edev-login="ssh root@$edev -p 2222"
alias run-tests="EVOLUX_TEST_INI='test_mysql.ini' nosetests --with-pylons='test_mysql.ini' -v -x $@"
alias ev="source ~/virtualenvs/evolux/bin/activate; cd $EVOLUXROOT"
alias evn="source ~/virtualenvs/evolux-node/bin/activate; cd $EVOLUXNODEROOT"
alias ls='ls -G'
alias grep='grep -nri --color --exclude-dir=".//.hg" --exclude=*.{pyc,patch,orig,rej}'

function restart_evolux() {
    ev
    fab stop_evolux_services -H edev
    fab stop_backend_services -H edev
    fab start_backend_services -H edev
    fab start_evolux_services -H edev
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.vm_env

export ONE_SKY_API_KEY="e1DEAQ0FIeEVfyatNsYHgoyFs7Nq3GX8"
export ONE_SKY_API_SECRET="Ji86AJmwf1n8nb4ooprE3Yz1yeJi762G"
export ONE_SKY_PROJECT_ID="226035"

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi


export GOROOT=$HOME/go-home
export PATH=$PATH:$GOROOT/bin
# safe sed grep get_random_password ./ --include=*.py | awk '{print }' | cut -d : -f 1 | uniq | awk '{print sed -i.bak s/get_random_password/random_secret/  -bash}' | sh -
