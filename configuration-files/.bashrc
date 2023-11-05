# .bashrc

set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# settings for Go programming language
# changing go packages installation path
export GOPATH=$HOME/area/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias grep="grep --color=always" # Color grep - highlight desired sequence.
alias g="cd"
alias x="exit"
alias b="cd .."
alias f="clear"
alias claer="clear"
alias clar="clear"
alias r="ranger"
alias pg="ping gnu.org"

# python
alias create-python-environment="python -m venv --upgrade-deps ./venv"
alias activate-python-environment="chmod +x ./venv/bin/activate && source ./venv/bin/activate"
alias install-python-requirements="sudo pip install -r requirements.txt"
