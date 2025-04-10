#!/bin/bash

echo "Linking binaries"
mkdir -p ~/bin
ln -s ~/.dotfiles/bin/* ~/bin/

echo "Setting up shells..."
if [[ "$OSTYPE" == "darwin"* ]]; then
   brew install git zsh boxes figlet tmux lsd fzf neovim gnu-sed diff-so-fancy jq shellcheck highlight bat graphviz

   ln -s ~/.dotfiles/config/nushell '/Users/rafaeldecastro/Library/Application Support/nushell'
fi

echo "Setting up window manager"
if [[ "$OSTYPE" == "darwin"* ]]; then
  ln -s ~/.dotfiles/hammerspoon ~/.hammerspoon
fi

# For convenience we will have this is Mac and Linux
ln -s ~/.dotfiles/config/nushell ~/.config/nushell

echo "Installing krew"
# See https://krew.sigs.k8s.io/docs/user-guide/setup/install/ to see if this is still relevant
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
kubectl krew install konfig

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
ln -fs ~/.dotfiles/config/xmonad ~/.xmonad
ln -fs ~/.dotfiles/config/xmonad/xmonad-custom.desktop ~/.local/share/applications/
ln -fs ~/.dotfiles/config/dunst ~/.config/dunst
ln -fs ~/.dotfiles/config/picom ~/.config/picom

echo "Setting up programming config files"
ln -fs ~/.dotfiles/tool-versions ~/.tool-versions
ln -fs ~/.dotfiles/ruby/pryrc ~/.pryrc
ln -fs ~/.dotfiles/jetbrains/ideavimrc ~/.ideavimrc

echo "Setting up application specific configs"
mkdir -p ~/.config
ln -fs ~/.dotfiles/config/polybar ~/.config/polybar
ln -fs ~/.dotfiles/config/rofi ~/.config/
ln -fs ~/.dotfiles/config/rofimoji.rc ~/.config/rofimoji.rc
ln -fs ~/.dotfiles/config/starship.toml ~/.config/starship.toml
ln -fs ~/.dotfiles/config/fish ~/.config/fish
ln -fs ~/.dotfiles/config/kitty ~/.config/kitty
ln -fs ~/.dotfiles/config/nvim ~/.config/nvim
ln -fs ~/.dotfiles/config/paru ~/.config/paru
ln -fs ~/.dotfiles/config/feh ~/.config/feh
ln -fs ~/.dotfiles/config/ulauncher ~/.config/ulauncher
ln -fs ~/.dotfiles/config/zed ~/.config/zed
ln -fs ~/.dotfiles/config/zellij ~/.config/zellij

echo "Creating user services. They are not enabled by default"
ln -fs ~/.dotfiles/systemd/ssh-agent.service ~/.config/systemd/user/ssh-agent.service
systemctl --user enable ssh-agent
systemctl --user start ssh-agent

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

echo "Setting up gnome settings"
source .dotfiles/scripts/gnome-settings.sh
