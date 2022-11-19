# Dotfiles

My humble dotfiles

Just clone and setup with

``` shell
git clone git@github.com:rafadc/dotfiles.git ~/.dotfiles
cd .dotfiles
make install
```

Remember to configure your shell as a login shell. In most linux distributions the shell is not like that by default.

## NVim

My vimfiles are also here to keep everythin gon the same repo

## Post configuration

### Fonts

My favourite font, Comic Code, is not free so you need to download it from https://www.myfonts.com

### Obsidian

RClone requires some manual steps to configure afterwards. App is already created but you need to manually run `rclone config` so the service can work correctly. There is a service to autosync obsidian in gdrive that expects `rafadecastro` to be the name of the RClone data source.

I provide a user service with a timer to sync GDrive data to use obsidian. It is disabled by default.

```
systemctl --user enable obsidian-gdrive.timer
systemctl --user enable obsidian-gdrive.service
```


