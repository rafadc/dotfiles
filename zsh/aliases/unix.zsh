#!/usr/bin/env zsh

take () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias -g l="lsd"

chpwd() {
  l
}


if [[ "$OSTYPE" == "darwin"* ]]; then
  alias flushdns="sudo killall -HUP mDNSResponder"
fi

alias more='less'

fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

alias icat="kitty +kitten icat"

alias cdr="cd \`git rev-parse --show-toplevel\`"
