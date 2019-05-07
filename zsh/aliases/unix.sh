take () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias ..="cd .."
alias l="lsd"

chpwd() {
  lsd
}

j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | gsed '/_____/Q; s/^[0-9,.:]*\s*//' |  fzf --height 40% --reverse --inline-info)"
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
