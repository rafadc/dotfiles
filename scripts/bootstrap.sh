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

echo "Configuring pyenv"
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo "Installing zplugin"
rm -rf ~/.zplugin
mkdir ~/.zplugin
git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin

touch ~/.dotfiles/zsh/zsecrets

ln -fs ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -fs ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -fs ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -fs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -fs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/zsh/fzf.zsh ~/.fzf.zsh
ln -fs ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh

ln -fs ~/.dotfiles/xmodmap .Xmodmap

echo "Symlinking binscripts"
ln -s ~/.dotfiles/bin/arch-news.sh ~/bin/
ln -s ~/.dotfiles/bin/xstream.sh ~/bin/

echo "Setting up window management"
ln -fs ~/.dotfiles/wm/xmonad ~/.xmonad
ln -fs ~/.dotfiles/config/dunst ~/.config/dunst

echo "Setting up programming config files"
ln -fs ~/.dotfiles/tool-versions ~/.tool-versions
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc

echo "Setting up application specific configs"
mkdir -p ~/.config
ln -fs ~/.dotfiles/config/ranger ~/.config/
ln -fs ~/.dotfiles/config/alacritty ~/.config/
ln -fs ~/.dotfiles/config/devilspie ~/.devilspie
ln -fs ~/.dotfiles/config/vifm ~/.config/
ln -fs ~/.dotfiles/config/kitty ~/.config/
ln -fs ~/.dotfiles/config/broot ~/.config/
ln -fs ~/.dotfiles/config/rofi ~/.config/
ln -fs ~/.dotfiles/config/rofimoji.rc ~/.config/rofimoji.rc
ln -fs ~/.dotfiles/config/starship.toml ~/.config/starship.toml

echo "Setting up tmux..."
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Config for git"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "Downloading vscode font for broot icons"
mkdir -p ~/.fonts
wget -O ~/.fonts/vscode.ttf https://github.com/Canop/broot/blob/master/resources/icons/vscode/vscode.ttf

