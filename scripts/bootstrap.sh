#!/bin/bash

echo "Linking binaries"
mkdir -p ~/bin
ln -s ~/.dotfiles/bin/* ~/bin/

echo "Setting up zsh..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew tap d12frosted/emacs-plus
    brew install git zsh boxes figlet tmux lsd fzf go-jira emacs-plus vim gnu-sed diff-so-fancy jq shellcheck highlight
fi
if [[ "$OSTYPE" == "linux"* ]]; then
   sudo apt-get update
   sudo apt-get install tmux git zsh fzf vim emacs sed jq shellcheck gawk
fi

echo "Installing zplugin"
rm -rf ~/.zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

echo "Changing shell"
chsh -s "$(which zsh)"

touch ~/.dotfiles/zsh/zsecrets

ln -fs ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -fs ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -fs ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -fs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -fs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc

mkdir -p ~/.config

echo "Setting up karabiner"
ln -fs ~/.dotfiles/karabiner ~/.config/karabiner

echo "Setting up ranger"
ln -fs ~/.dotfiles/ranger ~/.config/ranger

echo "Setting up tmux..."
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Config for git"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
