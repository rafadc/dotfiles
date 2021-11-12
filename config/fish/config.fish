. /usr/share/autojump/autojump.fish

source ~/.asdf/asdf.fish

if test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

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