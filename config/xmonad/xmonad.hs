import Custom.MyPolybar (myPolybar)
import Custom.MyLayouts (myLayout)

import XMonad

import XMonad.Util.SpawnOnce ( spawnOnce )
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Util.NamedScratchpad (scratchpadWorkspaceTag)
import XMonad.Util.WorkspaceCompare (filterOutWs)
import XMonad.Util.Hacks as Hacks
import XMonad.Hooks.ManageDocks (avoidStruts, docks)


defaults = def
    { terminal    = "kitty"
    , modMask     = mod4Mask
    , startupHook        = myStartupHook   
    , borderWidth = 3
    , layoutHook = avoidStruts myLayout
    }

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "feh --bg-scale ~/Pictures/Wallpapers/download.jpeg"
  spawnOnce "dunst"
  spawnOnce "telegram-desktop"
  spawnOnce "flameshot"
  spawnOnce "~/bin/overGrive-3.5.2-x86_64.AppImage"


main :: IO ()
main = xmonad 
        $ docks 
        $ Hacks.javaHack 
        $ withSB myPolybar 
        $ addEwmhWorkspaceSort (pure (filterOutWs [scratchpadWorkspaceTag]))
      {- force XMonad to *not* set _NET_DESKTOP_VIEWPORT available since commit cf13f8f (https://github.com/xmonad/xmonad-contrib/commit/cf13f8f9)
       - correct polybar order on dual monitors -}
      . disableEwmhManageDesktopViewport
      . ewmh $ defaults




