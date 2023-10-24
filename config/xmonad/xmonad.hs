import Custom.MyPolybar (myPolybar)
import Custom.MyLayouts (myLayout)
import Custom.MyStartupHook (myStartupHook)
import Custom.MyKeys (myKeys)
import Custom.MyRescreen (rescreenCfg)
import Custom.MyScratchpads (myScratchpads, myScratchpadKeys)

import XMonad

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Util.NamedScratchpad (scratchpadWorkspaceTag, namedScratchpadManageHook)
import XMonad.Util.WorkspaceCompare (filterOutWs)
import XMonad.Util.Hacks as Hacks
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Hooks.Rescreen (rescreenHook)

defaults = def
    { terminal    = "kitty"
    , modMask     = mod4Mask
    , startupHook        = myStartupHook   
    , borderWidth = 3
    , layoutHook = avoidStruts myLayout
    , manageHook = namedScratchpadManageHook myScratchpads
    } `additionalKeysP` myKeys ++ myScratchpadKeys

main :: IO ()
main = xmonad 
        $ docks 
        $ Hacks.javaHack 
          . rescreenHook rescreenCfg
        $ withSB myPolybar 
        $ addEwmhWorkspaceSort (pure (filterOutWs [scratchpadWorkspaceTag]))
      {- force XMonad to *not* set _NET_DESKTOP_VIEWPORT available since commit cf13f8f (https://github.com/xmonad/xmonad-contrib/commit/cf13f8f9)
       - correct polybar order on dual monitors -}
      . disableEwmhManageDesktopViewport
      . ewmh $ defaults




