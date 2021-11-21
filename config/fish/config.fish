. /usr/share/autojump/autojump.fish

source ~/.asdf/asdf.fish

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

starship init fish | source

alias gui=gitui
alias v=nvim

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

alias br=broot

alias ssh="kitty +kitten ssh"

direnv hook fish | source

alias k="kubectl"
alias ka="kubectl apply"

set -gx PATH $PATH $HOME/.cargo/bin

# Krew
set -gx PATH $PATH $HOME/.krew/bin

# COnda
eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source