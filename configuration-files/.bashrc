# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# settings for Go programming language
# changing go packages installation path
export GOPATH=$HOME/area/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias x="exit"
alias b="cd .."
alias f="clear"
alias r="ranger"
alias pg="ping gnu.org"
