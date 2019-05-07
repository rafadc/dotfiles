alias docker-clean-images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker-clean-ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker-compose='NO_PROXY=* docker-compose'
alias docker-vm-terminal="screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty"

function docker-compose() {
  if [[ "$1" == "down" ]]; then
    echo "AREEEEEEE YOU SUUUUUUUUREEEEEEEEEEE??????!\n"
    echo "This deletes your docker setup and you will have to wait 45 minutes for the db to import if you boot up the contains the next time."

    vared -p 'Are you sure you want to continue? [y/N]: ' -c response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
      echo "\nyou're crazy. Well, fine.."
      /usr/local/bin/docker-compose $@
    else
      echo "\nI'm so glad I set this alias!"
    fi
  else
    /usr/local/bin/docker-compose $@
  fi
}
