# ----------
# Ruby
# ----------

alias be="bundle exec"

# ----------
# Go
# ----------

alias gtest="go test \$(go list ./... | grep -v /vendor/) -tags=integration"

# ----------
# Python
# ----------

alias prp="pipenv run python"

# -----------
# Git aliases
# -----------

alias gstandup="git log --since yesterday --author `git config user.email` --pretty=short"
alias gundo="git reset --soft 'HEAD^'"

# ------------------------
# General Unix aliases
# -----------------------

take () {
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias ..="cd .."
alias l="lsd"

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias flushdns="sudo killall -HUP mDNSResponder"
fi

alias more='less'

alias brewfullupdate="brew update && brew upgrade && brew cleanup -s --prune=1"

alias serve="ruby -run -e httpd . -p 9090"

alias aria2c='aria2c --file-allocation=none -c -x 10 -s 10'

alias edaemon='emacs --daemon'
alias e='emacsclient --no-wait -c'
alias et='emacsclient -nw'
alias emacskill='emacsclient -e "(kill-emacs)"'

alias c="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

alias blink='blink1-tool --blink'

# --------------------
# macos specific aliases
# --------------------

if [[ `uname` == 'Darwin' ]]; then
    alias v='vim'
    alias vi='vim'
    alias ls='/usr/local/bin/gls --color -a'
    alias speedup_backups="sudo sysctl debug.lowpri_throttle_enabled=0"
fi

# ----------
# Docker
# ----------

alias docker-start='docker-machine start default; eval "$(docker-machine env default)"'
alias docker-stop='docker-machine stop default'
alias docker-clean-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker-compose='NO_PROXY=* docker-compose'
alias docker-vm-terminal="screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty"


source <(kubectl completion zsh)

function docker-compose() {
  if [[ "$1" == "down" ]]; then
    echo "AREEEEEEE YOU SUUUUUUUUREEEEEEEEEEE??????!\n"
    echo "This deletes your docker setup and you will have to wait 45 minutes for the db to import if you boot up the contains the next time."

    vared -p 'Are you sure you want to continue? [y/N]: ' -c response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      echo "\nyou're crazy. Well, fine.."
      /usr/local/bin/docker-compose $@
    else
      echo "\nI'm so glad I set this alias!"
    fi
  else
    /usr/local/bin/docker-compose $@
  fi
}


