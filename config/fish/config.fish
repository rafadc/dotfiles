if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/bin
end

if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

function fish_greeting
  cat ~/.dotfiles/terminal_welcome.txt | lolcat -f | boxes -d parchment
end

zoxide init fish | source

if test (uname) = "Darwin"
  [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
else
  . /usr/share/autojump/autojump.fish
end

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  source /opt/asdf-vm/asdf.fish
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
abbr --add zed zeditor
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# uv
fish_add_path "/Users/rafaeldecastro/.local/bin"
