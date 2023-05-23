#
# ~/.bashrc
#

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_STATE_HOME="$XDG_CONFIG_HOME/local/state"

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"

export CARGO_HOME="XDG_DATA_HOME/cargo"

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/MyScripts:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"

source $XDG_CONFIG_HOME/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

# Source global definitions
#if [ -f /etc/bash.bashrc ]; then
#	. /etc/bash.bashrc
#fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lal='ls -al --color=auto'
alias grep='grep --color=auto'

# https://askubuntu.com/questions/517677/how-do-i-get-a-colored-bash

rightprompt() {
    green=$(tput setaf 156)
    yellow=$(tput setaf 228)
    red=$(tput setaf 203)
    printf "%*s" "$((COLUMNS+33))" "${green}$(date +%a), ${yellow}$(date +%b\ %d), ${red}$(date +%H:%M)"
    #https://superuser.com/questions/1785177/adding-color-to-bash-right-prompt-causes-unwanted-behaviour
}

PS1='\n\[$(tput sc; rightprompt; tput rc)\]╭─\[\e[1;33m\]\u\[\e[31m\]@\[\e[32m\]\h\[\e[m\] in \[\e[1;36m\]\w\[\e[m\]\[$(__git_ps1 " | \[\e[30;47m\]  \[\e[38:5:88m\]%s \[\e[m\]")\]\n╰─\[\e[38:5:75m\]\[\e[m\] ';

alias vim='nvim'
alias emacs="emacsclient -c -a 'nvim'"

alias matrix='unimatrix -a -c red -f -s 94'
