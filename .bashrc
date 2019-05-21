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


export EVOLUXROOT=/var/sites/evolux
PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\e[0;33m\]$(git_branch)$(hg_branch)\n\[\e[0m\][\D{%H.%M.%S}] $ '
export EVOLUXNODEROOT=~/evolux-node
export edev="172.16.7.137"
alias edev-login="ssh root@$edev -p 2222"
alias run-tests="EVOLUX_TEST_INI='test_mysql.ini' nosetests --with-pylons='test_mysql.ini' -v -x $@"
alias ev="source /usr/local/pythonenv/evolux/bin/activate; cd $EVOLUXROOT"
alias evn="source ~/virtualenvs/evolux-node/bin/activate; cd $EVOLUXNODEROOT"
alias ls='ls --color -G'
alias ggrep='grep -nri --color --exclude-dir=".//.hg" --exclude-dir={.bzr,CVS,.git,.hg,.svn,node_modules,vendor,app_bundles} --exclude=*.{pyc,patch,orig,rej}'
#alias ggrep='grep -nri --color --exclude-dir=".//.hg" --exclude=*.{pyc,patch,orig,rej}'

function restart_evolux() {
    ev
    fab stop_evolux_services -H edev
    fab stop_backend_services -H edev
    fab start_backend_services -H edev
    fab start_evolux_services -H edev
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi


export GOROOT=$HOME/go-home
export PATH=$PATH:/snap/bin:$GOROOT/bin
# safe sed grep get_random_password ./ --include=*.py | awk '{print }' | cut -d : -f 1 | uniq | awk '{print sed -i.bak s/get_random_password/random_secret/  -bash}' | sh -
# tmux a -d


alias run-tests-pg='sudo -u postgres dropdb evolux_teste; sudo -u postgres createdb evolux_teste -O evolux; EVOLUX_TEST_INI='\''test_psql.ini'\'' nosetests --with-pylons='\''test_psql.ini'\'' --rednose -v -x '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock;
fi

LS_COLORS='ow=01;36;40'
export LS_COLORS

# ssh-agent configuration
if [ -z "$(pgrep ssh-agent)" ]; then
    rm -rf /tmp/ssh-*
    eval $(ssh-agent -s) > /dev/null
else
    export SSH_AGENT_PID=$(pgrep ssh-agent)
    export SSH_AUTH_SOCK=$(find /tmp/ssh-* -name agent.*)
fi

if [ "$(ssh-add -l)" == "The agent has no identities." ]; then
    ssh-add 1> /dev/null 2> /dev/null
fi

for i in /var/lib/snapd/desktop/applications/*.desktop; do
    if [ ! -f ~/.local/share/applications/${i##*/} ];then
            ln -s /var/lib/snapd/desktop/applications/${i##*/} ~/.local/share/applications/${i##*/};
    fi;
done

export LC_TMPVIM=/tmp/sergio_vimrc
export LC_TMPBASH=/tmp/sergio_bash
function sssh() {
    host=$1
    scp -P2222 ~/.vimrc root@$host:$LC_TMPVIM
    scp -P2222 ~/.bashrc root@$host:$LC_TMPBASH
    ssh -o SendEnv=LC_TMPVIM root@$host -p2222
}

#TMUX ALIASES
alias tkill='tmux kill-session -t'
alias tls='tmux ls'
alias tmux='tmux -u'

eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.256dark`
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
source $HOME/.env

alias s2svpn="sudo openvpn --config sfilipe.conf"
export EDITOR='vim'
