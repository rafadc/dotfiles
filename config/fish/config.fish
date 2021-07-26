. /usr/share/autojump/autojump.fish

starship init fish | source

alias gui=gitui
alias v=nvim

function take
  mkdir $argv
  cd $argv
end

alias docker-restart='sudo systemctl restart docker && docker-stop-all'
