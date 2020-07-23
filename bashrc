export HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

export HISTFILESIZE=
export HISTSIZE=
export TERMINAL=`tty | cut -c6-8,10-`
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history.$TERMINAL
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="\history -a; $PROMPT_COMMAND"

function myhistory(){
  mytty=`tty | cut -c6-8,10-`
  if [ $# -eq 0 ]
  then
    \history
  elif [ $1 = 'all' ]
  then
    ls -1 ~/.bash_eternal_history.* | while read line
    do
      pts="${line##*.}"
      myhistory $pts
    done | sort -k3
  elif [ -e ~/.bash_eternal_history.$1 ]
  then
    \history -a
    \history -c
    \history -r ~/.bash_eternal_history.$1
    \history | while read line ; do printf "($1) %s\n" "$line" ; done
    \history -c
    \history -r ~/.bash_eternal_history.$mytty
  else
    \history $*
  fi
}

alias history=myhistory
