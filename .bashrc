#
# ~/.bashrc
#

# Use bash-completion, if available

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.config/MyScripts:$PATH"

source ~/.git-prompt.sh

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
# 156, 228, 203

rightprompt() {
    green=$(tput setaf 156)
    yellow=$(tput setaf 228)
    red=$(tput setaf 203)
    printf "%*s" $COLUMNS "${green}$(date +%a), ${yellow}$(date +%b\ %d), ${red}$(date +%H:%M)"
}
PS1='\n\[$(tput sc; rightprompt; tput rc)\]╭─\[\e[1;33m\]\u\[\e[31m\]@\[\e[32m\]\h\[\e[m\] in \[\e[1;36m\]\w\[\e[m\]$(__git_ps1 " | \[\e[30;47m\]  \[\e[38:5:88m\]%s \[\e[m\]")\n╰─\[\e[35m\]\[\e[m\] '

alias vim='nvim'
alias emacs="emacsclient -c -a 'nvim'"

alias matrix='unimatrix -a -c red -f -s 94'
