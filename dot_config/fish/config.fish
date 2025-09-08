if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/bin
end

# Secrets maangement
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

function bw-unlock
    set -x BW_SESSION (bw unlock --raw)
    echo "Bitwarden session unlocked"
end

function fish_greeting
  cat ~/.dotfiles/terminal_welcome.txt | lolcat -f | boxes -d parchment
end

zoxide init fish | source

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  source /usr/share/fish/vendor_completions.d/asdf.fish
end

if test (uname) = "Linux"
  set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end

if test (uname) = "Darwin"
  set -x DBUS_SESSION_BUS_ADDRESS "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
end

# EDITORS

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

if test (uname) = "Darwin"
  fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
end

fish_add_path ~/.claude/local/claude

# SHELL

starship init fish | source

# ALIASES
alias cp=xcp

abbr --add g gitui
abbr --add v nvim
alias vim="nvim"
abbr --add l lsd
abbr --add b bat
abbr --add s kitten ssh
abbr --add zj zellij

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

if test (uname) = "Darwin"
  fish_add_path /usr/local/texlive/2024/bin/universal-darwin
end

# FZF
set fzf_fd_opts --hidden --exclude=.git

# Mise
mise activate fish | source

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
if test (uname) = "Darwin"
  fish_add_path /opt/homebrew/opt/rustup/bin
end

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

# Python
if test (uname) = "Darwin"
  fish_add_path /opt/homebrew/anaconda3/bin
end

# Appimages
fish_add_path $HOME/appimages

function gitsyncupstream
  git fetch upstream
  git checkout master
  git rebase upstream/master
end

# uv
fish_add_path "/Users/rafaeldecastro/.local/bin"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Emacs
fish_add_path $HOME/.emacs.d/bin

alias claude="/home/rafadc/.claude/local/claude"
