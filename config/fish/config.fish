set fish_greeting

. /usr/share/autojump/autojump.fish

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  source /usr/share/fish/vendor_completions.d/asdf.fish
end

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

fish_add_path $HOME/.local/bin/

# FZF
alias fd=fdfind # In Ubuntu
set fzf_fd_opts --hidden --exclude=.git

# Kubernetes
alias k="kubectl"
alias ka="kubectl apply"
fish_add_path $HOME/.krew/bin

# Haskell
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin

# Rust
fish_add_path $HOME/.cargo/bin

# Google cloud SDK
fish_add_path $HOME/bin/google-cloud-sdk/bin

# Krew
fish_add_path $HOME/.krew/bin

# Nim
fish_add_path $HOME/.nimble/bin

# Go
set -gx GOPATH $HOME/go
fish_add_path $HOME/go/bin

# Appimages
fish_add_path $HOME/appimages

# Doom emacs
fish_add_path $HOME/.emacs.d/bin

function gitsyncupstream
  git fetch upstream
  git checkout master
  git rebase upstream/master
end
