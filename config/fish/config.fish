if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/bin
end

function fish_greeting
  cat ~/.dotfiles/terminal_welcome.txt | lolcat -f | boxes -d parchment
end

zoxide init fish | source

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
else
  source /opt/asdf-vm/asdf.fish
  source /usr/share/fish/vendor_completions.d/asdf.fish
end

if test (uname) = "Linux"
  set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

starship init fish | source

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

# VSCode
if test (uname) = "Darwin"
  fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
end

# FZF
set fzf_fd_opts --hidden --exclude=.git

# Kubernetes
alias k="kubectl"
alias ka="kubectl apply"

# Ruby
alias be="bundle exec"
set -gx RUBY_CONFIGURE_OPTS --enable-yjit

# Haskell
fish_add_path $HOME/.cabal/bin
fish_add_path $HOME/.ghcup/bin

# Rust
fish_add_path $HOME/.cargo/bin
if test (uname) = "Darwin"
  fish_add_path /opt/homebrew/opt/rustup/bin
end

# Nim
fish_add_path $HOME/.nimble/bin

# Go
set -gx GOPATH $HOME/go
set -gx GOBIN $HOME/go/bin
fish_add_path $HOME/go/bin

# Android
set -x ANDROID_SDK_ROOT $HOME/Library/Android/Sdk
fish_add_path  $ANDROID_SDK_ROOT/emulator  $ANDROID_SDK_ROOT/platform-tools

# Appimages
fish_add_path $HOME/appimages

function gitsyncupstream
  git fetch upstream
  git checkout master
  git rebase upstream/master
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/rafadc/anaconda3/bin/conda
    eval /home/rafadc/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/rafadc/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/rafadc/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/rafadc/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
