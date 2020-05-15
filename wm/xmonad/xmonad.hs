import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.Gaps
import XMonad.Hooks.ManageDocks
import XMonad.Util.Dzen
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.StackSet as W
import XMonad.Util.NamedScratchpad

main = do
  xmonad $ defaultConfig
    {
      XMonad.workspaces  = ["1:dev","2:comm","3","4","5","6","7","8","9","0","-","="]
    , terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , layoutHook  = myLayouts
    , startupHook = myStartupHook
    } `additionalKeysP` myKeys

myKeys = [
           ("M-p", spawn "rofi -show run"),
           ("M-S-p", spawn "dmenu_run"),
           ("<Print>", spawn "flameshot gui"),
           ("M-n", namedScratchpadAction scratchpads "vifm"),
           ("M-S-n", spawn "alacritty -e vifm ~"),
           ("M-e", spawn "rofimoji"),
           ("M-t", namedScratchpadAction scratchpads "notes"),
           ("M-S-s", namedScratchpadAction scratchpads "pavucontrol"),
           ("M-i", namedScratchpadAction scratchpads "hexchat"),
           ("M-s", namedScratchpadAction scratchpads "slack")
         ]

scratchpads :: [NamedScratchpad]
scratchpads = [
                NS "vifm" "alacritty --class vifm -e vifm" (resource =? "vifm") centered,
                NS "notes" "alacritty --class notes -e vim ~/notes.md" (resource =? "notes") centered,
                NS "pavucontrol" "pavucontrol" (resource =? "pavucontrol") centeredSmall,
                NS "hexchat" "hexchat" (resource =? "hexchat") centered,
                NS "slack" "slack" (resource =? "slack") centered
              ]
              where
                centered = customFloating $ W.RationalRect 0.9 0.9 0.05 0.05
                centeredSmall = customFloating $ W.RationalRect l t w h
                  where
                    h = 0.6       -- height, 60%
                    w = 0.6       -- width, 60%
                    t = (1 - h)/2 -- centered top/bottom
                    l = (1 - w)/2 -- centered left/right

myTerminal :: String
myTerminal    = "alacritty"

myModMask :: KeyMask
myModMask     = mod4Mask -- Win key or Super_L

myBorderWidth :: Dimension
myBorderWidth = 3

myLayouts = avoidStruts $ spacing 10 $ ThreeColMid 1 (3/100) (1/2) ||| ThreeCol 1 (3/100) (1/2) ||| Grid ||| Tall 1 (3/100) (1/2) ||| Full

myStartupHook = spawnHere "feh --randomize --bg-fill ~/Pictures/Wallpapers"
