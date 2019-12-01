if [[ `uname` == 'Darwin' ]]; then
    alias c="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias brewfullupdate="brew update && brew upgrade && brew cask upgrade && brew cleanup -s --prune=1"

    alias ls='/usr/local/bin/gls --color -a'
    alias timemachine_speedup="sudo sysctl debug.lowpri_throttle_enabled=0"
fi
