function fish_greeting
  cat ~/.dotfiles/terminal_welcome.txt | lolcat -f | boxes -d parchment
end

zoxide init fish | source

. /usr/share/autojump/autojump.fish

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  source /opt/asdf-vm/asdf.fish
  source /usr/share/fish/vendor_completions.d/asdf.fish
end

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

starship init fish | source

alias cp=xcp

abbr --add g gitui
abbr --add v nvim
alias vim="nvim"
abbr --add l lsd
abbr --add b bat
abbr --add hc habito checkin

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

fish_add_path $HOME/bin/
fish_add_path $HOME/.local/bin/

# FZF
set fzf_fd_opts --hidden --exclude=.git

# Kubernetes
alias k="kubectl"
alias ka="kubectl apply"
fish_add_path $HOME/.krew/bin

# Ruby
alias be="bundle exec"

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
set -gx GOBIN $HOME/go/bin
fish_add_path $HOME/go/bin

# Appimages
fish_add_path $HOME/appimages

function gitsyncupstream
  git fetch upstream
  git checkout master
  git rebase upstream/master
end
