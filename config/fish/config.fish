. /usr/share/autojump/autojump.fish

source ~/.asdf/asdf.fish

set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

starship init fish | source

abbr --add gui gitui
abbr --add v nvim
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

alias br=broot

direnv hook fish | source

alias k="kubectl"
alias ka="kubectl apply"

function k9s
  docker run --rm -it -v $KUBECONFIG:/root/.kube/config quay.io/derailed/k9s
end

set -gx PATH $PATH $HOME/.cargo/bin

# Krew
set -gx PATH $PATH $HOME/.krew/bin

# Conda
eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source
conda deactivate

# Nim
set -gx PATH $PATH $HOME/.nimble/bin

# Go
set -gx PATH $PATH $HOME/go/bin

# Appimages
set -gx PATH $PATH $HOME/appimages

# Doom emacs
set -gx PATH $PATH $HOME/.emacs.d/bin
