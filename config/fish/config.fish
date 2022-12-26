set fish_greeting

. /usr/share/autojump/autojump.fish

source ~/.asdf/asdf.fish

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

starship init fish | source

alias cp=xcp

abbr --add gui gitui
abbr --add v lvim
alias vim="nvim"
abbr --add l lsd

function take
  mkdir $argv
  cd $argv
end

function docker-stop-all
  docker stop (docker ps -a -q)
end

alias docker-restart='sudo systemctl restart docker && docker-stop-all'
alias dc='docker-compose'
alias dcr='docker-compose run --rm'

direnv hook fish | source

# FZF
alias fd=fdfind # In Ubuntu
set fzf_fd_opts --hidden --exclude=.git

# Kubernetes

alias k="kubectl"
alias ka="kubectl apply"

# Haskell
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# Google cloud SDK
set -gx PATH $PATH $HOME/bin/google-cloud-sdk/bin

# Krew
set -gx PATH $PATH $HOME/.krew/bin

# Nim
set -gx PATH $PATH $HOME/.nimble/bin

# Go
set -gx GOPATH $HOME/go
set -gx PATH $PATH $HOME/go/bin

# Appimages
set -gx PATH $PATH $HOME/appimages

# Doom emacs
set -gx PATH $PATH $HOME/.emacs.d/bin

function gitsyncupstream
  git fetch upstream
  git checkout master
  git rebase upstream/master
end
