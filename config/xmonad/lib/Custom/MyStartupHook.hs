module Custom.MyStartupHook where

import XMonad
import XMonad.Util.SpawnOnce (spawnOnce)

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "picom"
  spawn "feh --bg-scale ~/Pictures/Wallpapers/download.jpeg"
  spawn "~/.dotfiles/xppen.sh"
  spawnOnce "obs --startvirtualcam"
  spawnOnce "dunst"
  spawnOnce "telegram-desktop -startintray"
  spawnOnce "flameshot"
  spawnOnce "~/bin/overGrive-3.5.2-x86_64.AppImage"
  spawnOnce "nm-applet"
  spawnOnce "blueman-applet"
  spawnOnce "companion || true"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

