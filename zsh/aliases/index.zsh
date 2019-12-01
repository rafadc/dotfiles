# ----------
# Python
# ----------

alias prp="pipenv run python"

# ------------------------
# General Unix aliases
# -----------------------

alias serve="ruby -run -e httpd . -p 9090"

alias aria2c='aria2c --file-allocation=none -c -x 10 -s 10'

alias blink='blink1-tool --blink'

alias cat=bat

# --------------------
# macos specific aliases
# --------------------

if [[ `uname` == 'Darwin' ]]; then
    alias c="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
    alias brewfullupdate="brew update && brew upgrade && brew cask upgrade && brew cleanup -s --prune=1"

    alias ls='/usr/local/bin/gls --color -a'
    alias speedup_backups="sudo sysctl debug.lowpri_throttle_enabled=0"
fi
