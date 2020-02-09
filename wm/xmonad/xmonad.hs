import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks

main = do
  xmonad $ defaultConfig
    {
      workspaces  = ["1:dev","2:comm","3","4","5","6","7","8","9:stream","0","-","="]
    , manageHook  = myManageHook <+> manageHook defaultConfig -- uses default too
    , terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    , layoutHook  = myLayouts
    , startupHook = myStartupHook
    }

myTerminal :: String
myTerminal    = "alacritty"

myModMask :: KeyMask
myModMask     = mod4Mask -- Win key or Super_L

myBorderWidth :: Dimension
myBorderWidth = 3

myLayouts = avoidStruts $ spacing 10 $ Tall 1 (3/100) (1/2) ||| ThreeColMid 1 (3/100) (1/2) ||| Full

myStartupHook = spawnHere "feh --randomize --bg-fill ~/Pictures/Wallpapers"

myManageHook = composeAll
   [ className =? "emacs"       --> doShift "1:dev"
   , className =? "slack"       --> doShift "2:comm"
   , className =? "hexchat"     --> doShift "2:comm"
   , className =? "thunderbird" --> doShift "2:comm"
   , className =? "obs"         --> doShift "9:stream"
   , className =? "steam"       --> doFloat
   , manageDocks
   ]
