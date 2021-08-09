. /usr/share/autojump/autojump.fish

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

direnv hook fish | source