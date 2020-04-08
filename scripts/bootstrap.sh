#!/bin/bash

echo "Linking binaries"
mkdir -p ~/bin
ln -s ~/.dotfiles/bin/* ~/bin/

echo "Setting up zsh..."
if [[ "$OSTYPE" == "darwin"* ]]; then
   brew tap d12frosted/emacs-plus
   brew install git zsh boxes figlet tmux lsd fzf go-jira emacs-plus vim gnu-sed diff-so-fancy jq shellcheck highlight bat graphviz

   echo "Setting up karabiner"
   ln -fs ~/.dotfiles/karabiner ~/.config/karabiner
fi
if [[ "$OSTYPE" == "linux"* ]]; then
   $PACKAGES = "tmux git zsh fzf vim emacs sed jq shellcheck gawk graphviz"
   if grep -q ubuntu "/proc/version"; then
     sudo apt-get update
     sudo apt-get install $PACKAGES
   fi
   if grep -q arch "/proc/version"; then
     sudo pacman -Syu
     sudo pacman -S $PACKAGES
   fi
   ln -fs ~/.dotfiles/xinitrc ~/.xinitrc
fi

echo "Configuring pyenv"
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo "Installing zplugin"
rm -rf ~/.zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

echo "Setting up shell"
chsh -s "$(which zsh)"

touch ~/.dotfiles/zsh/zsecrets

ln -fs ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -fs ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -fs ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -fs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -fs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/zsh/fzf.zsh ~/.fzf.zsh
ln -fs ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh

ln -s ~/.dotfiles/xmodmap .Xmodmap

echo "Symlinking binscripts"
ln -s ~/.dotfiles/bin/arch-news.sh ~/bin/

echo "Setting up window management"
ln -fs ~/.dotfiles/wm/xmonad ~/.xmonad
ln -fs ~/.dotfiles/config/dunst ~/.dunst

echo "Setting up programming config files"
ln -fs ~/.dotfiles/tool-versions ~/.tool-versions
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc

echo "Setting up application specific configs"
mkdir -p ~/.config
ln -fs ~/.dotfiles/config/ranger ~/.config/
ln -fs ~/.dotfiles/config/alacritty ~/.config/
ln -fs ~/.dotfiles/config/devilspie ~/.devilspie

echo "Setting up tmux..."
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Config for git"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
