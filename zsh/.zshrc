# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ -n "$INSIDE_EMACS" ]; then
    [[ $EMACS = t ]] && unsetopt zle
    ZSH_THEME="miloshadzic"
    export TERM=eterm-color
else
    ZSH_THEME="avit"
    export TERM=xterm-256color
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails git osx mix tmux zsh-navigation-tools zsh-syntax-highlighting jira)

JIRA_DEFAULT_ACTION="dashboard"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PROMPT='$(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version)
👻  ▶  '

[[ -s "/Users/rafael/.rvm/scripts/rvm" ]] && source "/Users/rafael/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

unsetopt sharehistory

fpath=(/usr/local/share/zsh-completions $fpath)

export PATH=$HOME/bin:$PATH:/usr/local/share/npm/bin

alias rvm="nocorrect rvm"
alias be="bundle exec"

# Git aliases
alias g="git status"
alias gck="git checkout"
alias gstandup="git log --since yesterday --author `git config user.email` --pretty=short"
alias gpll="git pull"
alias gpsh="git push"
alias ga="git add"
alias gc="git commit"
alias gac="git add -A . && git commit"
alias gdiff="git diff"
alias gundo="git reset --soft 'HEAD^'"
alias gl="git log --graph --decorate --all --oneline"

alias ls='gls --color -lah'

# ------------------------
# General Unix aliases
# -----------------------

alias l="ls -la"
alias rm="rmtrash"
alias vpn_cygus="sshuttle --dns -vvr cyg.us 0/0"

# To enable syntax highlight in less first you need to brew install source-highlight
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

alias brewfullupdate="brew update && brew cask update && brew upgrade && brew cleanup && brew cask cleanup"

alias serve="ruby -run -e httpd . -p 9090"

alias docker-start='docker-machine start default; eval "$(docker-machine env default)"'
alias docker-stop='docker-machine stop default'

alias aria2c='aria2c --file-allocation=none -c -x 10 -s 10'

alias s='subl'
alias vi='nvim'
alias v='nvim'
alias edaemon='emacs --daemon'
alias e='emacsclient --no-wait -c'
alias et='emacsclient -nw'
alias emacskill='emacsclient -e "(kill-emacs)"'

# Pairing aliases
alias pair_tmux_new='tmux -S /var/tmux/pair_socket new-session -s pair_session'
alias pair_tmux_attach='tmux -S /var/tmux/pair_socket attach -t pair_session'
alias pair_adduser='sudo -u pair -i gh-auth add --users '
alias pair_removeuser='sudo -u pair -i gh-auth remove --users '

alias blink='blink1-tool --blink'

# Command for going to the current ticket in jira in a P161 project
jr() {
  jira $(git branch | sed -n '/* /s///p' | sed -n '/PFM/p' | awk -F. '{ print $1 }')
}

export EDITOR="emacsclient --no-wait -c"
export VISUAL="emacsclient --no-wait -c"

export NODE_MODULES="/usr/local/lib/node_modules"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Go settings
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Tmuxinator
source ~/.dotfiles/zsh/tmuxinator.zsh

echo

export NVM_DIR="/Users/rafael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by travis gem
[ -f /Users/rafael/.travis/travis.sh ] && source /Users/rafael/.travis/travis.sh

fortune | ponysay
