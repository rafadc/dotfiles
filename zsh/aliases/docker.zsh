#!/usr/bin/env zsh
alias docker-clean-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker-compose='NO_PROXY=* docker-compose'
alias docker-vm-terminal="screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty"

function docker_stop_all() {
  docker stop $(docker ps -a -q)
}
