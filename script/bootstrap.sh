#!/bin/bash

mkdir -p ~/bin

echo "Setting up zsh..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew tap d12frosted/emacs-plus
    brew install git zsh boxes figlet tmux lsd fzf go-jira emacs-plus vim gnu-sed diff-so-fancy
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

echo "Config for git"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
