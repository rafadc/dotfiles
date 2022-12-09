#!/bin/bash

echo "Linking binaries"
mkdir -p ~/bin
ln -s ~/.dotfiles/bin/* ~/bin/

echo "Setting up zsh..."
if [[ "$OSTYPE" == "darwin"* ]]; then
   brew tap d12frosted/emacs-plus
   brew install git zsh boxes figlet tmux lsd fzf go-jira emacs-plus vim gnu-sed diff-so-fancy jq shellcheck highlight bat graphviz
fi

echo "Configuring pyenv"
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

touch ~/.dotfiles/zsh/zsecrets

ln -fs ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -fs ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -fs ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -fs ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -fs ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/zsh/fzf.zsh ~/.fzf.zsh

ln -fs ~/.dotfiles/xmodmap ~/.Xmodmap

echo "Symlinking binscripts"
ln -s ~/.dotfiles/bin/arch-news.sh ~/bin/
ln -s ~/.dotfiles/bin/xstream.sh ~/bin/

echo "Installing pulseaudio control script"
curl https://raw.githubusercontent.com/marioortizmanero/polybar-pulseaudio-control/master/pulseaudio-control.bash --output ~/bin/pulseaudio-control
chmod +x ~/bin/pulseaudio-control

echo "Symlinking ssh config"
mkdir -p ~/.ssh
ln -s ~/.dotfiles/ssh.config ~/.ssh/config

echo "Setting up window management"
ln -fs ~/.dotfiles/wm/xmonad ~/.xmonad
ln -fs ~/.dotfiles/config/dunst ~/.config/dunst

echo "Setting up programming config files"
ln -fs ~/.dotfiles/tool-versions ~/.tool-versions
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc
ln -fs ~/.dotfiles/jetbrains/ideavimrc ~/.ideavimrc

echo "Setting up application specific configs"
mkdir -p ~/.config
ln -fs ~/.dotfiles/config/eww-1920 ~/.config/eww
ln -fs ~/.dotfiles/config/polybar ~/.config/polybar
ln -fs ~/.dotfiles/config/rofi ~/.config/
ln -fs ~/.dotfiles/config/rofimoji.rc ~/.config/rofimoji.rc
ln -fs ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -fs ~/.dotfiles/config/fish ~/.config/fish
ln -fs ~/.dotfiles/config/wezterm ~/.config/wezterm
ln -fs ~/.dotfiles/config/nvim ~/.config/nvim

echo "Creating user services. They are not enabled by default"
ln -fs ~/.dotfiles/systemd/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
ln -fs ~/.dotfiles/systemd/obsidian-gdrive.service ~/.config/systemd/user/obsidian-gdrive.service
ln -fs ~/.dotfiles/systemd/obsidian-gdrive.timer ~/.config/systemd/user/obsidian-gdrive.timer

echo "Setting up tmux..."
ln -fs ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Config for git"
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

echo "Downloading vscode font for broot icons"
mkdir -p ~/.fonts
wget -O ~/.fonts/vscode.ttf https://github.com/Canop/broot/blob/master/resources/icons/vscode/vscode.ttf

echo "Setting global gitignore"
ln -fs ~/.dotfiles/global_gitignore ~/.global_gitignore
git config --global core.excludesfile ~/.global_gitignore
