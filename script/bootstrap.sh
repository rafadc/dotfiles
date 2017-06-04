mkdir ~/bin

echo "Setting up zsh..."
brew install git zsh boxes figlet

chsh -s $(which zsh)

ln -s ~/.dotfiles/zsh/zlogin ~/.zlogin
ln -s ~/.dotfiles/zsh/zlogout ~/.zlogout
ln -s ~/.dotfiles/zsh/zprofile ~/.zprofile
ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

echo "Setting up tmux..."
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
