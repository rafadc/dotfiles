#!/bin/bash

mkdir -p ~/bin

echo "Setting up zsh..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install git zsh boxes figlet
fi

chsh -s $(which zsh)

touch ~/.dotfiles/zsh/zsecrets

ln -fs ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -fs ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -fs ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -fs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -fs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc

mkdir -p ~/.config
ln -fs ~/.dotfiles/karabiner ~/.config/karabiner

echo "Setting up tmux..."
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
