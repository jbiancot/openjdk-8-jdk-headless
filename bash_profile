EDITOR=/bin/nano
VISUAL=$EDITOR
export EDITOR VISUAL

LESS="-x4";export LESS

PS1="\[\e[33;1;31m\][\u@\h \w] \[\e[0m\] "
export PS1

alias .='pwd'
alias ..='cd ..'
alias cd..='cd ..'

alias l='ls -lh'
alias ll='ls -alh'
alias lt='ls -ltrh'
alias tmp='cd /tmp/'

alias ports='netstat -an | grep LISTEN | head -20'
alias ports2='lsof -i tcp -P | grep LISTEN'

alias ipt='iptables -L -n -v'
