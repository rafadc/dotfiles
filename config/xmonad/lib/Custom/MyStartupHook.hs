module Custom.MyStartupHook where

import XMonad
import XMonad.Util.SpawnOnce ( spawnOnce )

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "feh --bg-scale ~/Pictures/Wallpapers/download.jpeg"
  spawnOnce "dunst"
  spawnOnce "telegram-desktop -startintray"
  spawnOnce "flameshot"
  spawnOnce "~/bin/overGrive-3.5.2-x86_64.AppImage"
  spawnOnce "nm-applet"



