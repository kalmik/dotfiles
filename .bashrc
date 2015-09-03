# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

#===========================================
# Váriavies com as Cores
#===========================================
NONE="\[\e[0m\]" # Eliminar as Cores, deixar padrão)
 
## Cores de Fonte
K="\[\e[0;30m\]" # Black (Preto)
R="\[\e[0;31m\]" # Red (Vermelho)
G="\[\e[0;32m\]" # Green (Verde)
Y="\[\e[0;33m\]" # Yellow (Amarelo)
B="\[\e[0;34m\]" # Blue (Azul)
M="\[\e[0;35m\]" # Magenta (Vermelho Claro)
C="\[\e[0;36m\]" # Cyan (Ciano - Azul Claro)
W="\[\e[0;37m\]" # White (Branco)
 
## Efeito Negrito (bold) e cores
BK="\[\e[1;30m\]" # Bold+Black (Negrito+Preto)
BR="\[\e[1;31m\]" # Bold+Red (Negrito+Vermelho)
BG="\[\e[1;32m\]" # Bold+Green (Negrito+Verde)
BY="\[\e[1;33m\]" # Bold+Yellow (Negrito+Amarelo)
BB="\[\e[1;34m\]" # Bold+Blue (Negrito+Azul)
BM="\[\e[1;35m\]" # Bold+Magenta (Negrito+Vermelho Claro)
BC="\[\e[1;36m\]" # Bold+Cyan (Negrito+Ciano - Azul Claro)
BW="\[\e[1;37m\]" # Bold+White (Negrito+Branco)
 
## Cores de fundo (backgroud)
BGK="\[\e[40m\]" # Black (Preto)
BGR="\[\e[41m\]" # Red (Vermelho)
BGG="\[\e[42m\]" # Green (Verde)
BGY="\[\e[43m\]" # Yellow (Amarelo)
BGB="\[\e[44m\]" # Blue (Azul)
BGM="\[\e[45m\]" # Magenta (Vermelho Claro)
BGC="\[\e[46m\]" # Cyan (Ciano - Azul Claro)
BGW="\[\e[47m\]" # White (Branco)

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	# PS1='\u@\h:\W\n\$ '  # Default
	PS1='\[\e[0;36m\]\u@\h:\[\e[0;34m\]\w\[\e[0;33m\]$(parse_git_branch)\n\[\e[0m\]$ '
    # PS1='\u@\h:\w$(parse_git_branch)\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\[\e[0;33m\]$(parse_git_branch)\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="/usr/local/node/bin:$PATH"
sm_lib_bin="/home/sergio/ark-aic/sm-sc/src/lib/bin"
sm_lib="/home/sergio/ark-aic/sm-sc/src/lib"
sm="/home/sergio/ark-aic/sm-sc"

function sharelib()
{
    g++ -shared -fPIC $1.cpp -o $sm_lib_bin/lib$1.so
}

function compile()
{
    g++ $1.cpp -o $sm/bin/$1 -L $sm_lib_bin $2 $3 $4 $5 $6
}

function run()
{
    LD_LIBRARY_PATH="$sm_lib_bin" $sm/bin/$1
}

alias sharelib=sharelib
alias compile=compile
alias run=run

export PATH=${PATH}:/home/sergio/Downloads/android-sdk-linux/tools
export ANDROID_HOME=/home/sergio/Downloads/android-sdk-linux/tools
export TERM=xterm-256color
