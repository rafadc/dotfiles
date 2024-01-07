import Custom.MyKeys (myKeys)
import Custom.MyLayouts (myLayout)
import Custom.MyPolybar (myPolybar)
import Custom.MyRescreen (rescreenCfg)
import Custom.MyStartupHook (myStartupHook)
import Custom.MyManageHook (myManageHook)
import Custom.MyScratchpads (myScratchpadKeys)

import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Hooks.Rescreen (rescreenHook)
import XMonad.Hooks.StatusBar
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Hacks as Hacks
import XMonad.Util.NamedScratchpad (scratchpadWorkspaceTag)
import XMonad.Util.WorkspaceCompare (filterOutWs)

defaults =
  def
    { terminal = "kitty",
      modMask = mod4Mask,
      startupHook = myStartupHook,
      borderWidth = 3,
      layoutHook = avoidStruts myLayout,
      manageHook = myManageHook
    }
    `additionalKeysP` ( myKeys ++ myScratchpadKeys )

myEwmh =
  addEwmhWorkspaceSort (pure (filterOutWs [scratchpadWorkspaceTag]))
    {- force XMonad to *not* set _NET_DESKTOP_VIEWPORT available since commit cf13f8f (https://github.com/xmonad/xmonad-contrib/commit/cf13f8f9)
     - correct polybar order on dual monitors -}
    . disableEwmhManageDesktopViewport
    . ewmh

main :: IO ()
main =
  xmonad
    $ docks
    $ Hacks.javaHack
      . rescreenHook rescreenCfg
    $ withSB myPolybar
    $ myEwmh
      defaults
