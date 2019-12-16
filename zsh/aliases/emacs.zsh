#!/usr/bin/env zsh

alias edaemon='emacs --daemon'
alias et='emacsclient -nw'
alias emacskill='emacsclient -e "(kill-emacs)"'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias e='emacsclient --frame-parameters="((undecorated . t))" --no-wait --create-frame'
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias e='emacsclient --no-wait --create-frame'
fi
