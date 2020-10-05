import XMonad
import Data.List (isPrefixOf, nub)

import XMonad.Actions.SpawnOn
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.Gaps
import XMonad.Layout.WorkspaceDir
import XMonad.Prompt
import XMonad.Util.EZConfig(additionalKeysP)
import qualified XMonad.StackSet as W
import XMonad.Util.NamedScratchpad
import XMonad.ManageHook
import XMonad.Hooks.SetWMName

main = do
  xmonad $ defaultConfig
    {
      XMonad.workspaces  = ["1:dev","2:comm","3","4","5","6","7","8","9","0","-","="]
    , terminal    = myTerminal
    , modMask     = myModMask
    , normalBorderColor  = fgColor promptConfig
    , focusedBorderColor = bgColor promptConfig
    , borderWidth = myBorderWidth
    , layoutHook  = myLayouts
    , startupHook = myStartupHook
    , manageHook  = namedScratchpadManageHook scratchpads
    } `additionalKeysP` myKeys

myKeys = [
           ("M-p", spawn "rofi -show run"),
           ("M-S-p", spawn "dmenu_run"),
           ("<Print>", spawn "flameshot gui"),
           ("M-n", namedScratchpadAction scratchpads "vifm"),
           ("M-S-n", spawn "alacritty -e vifm ~"),
           ("M-e", spawn "rofimoji"),
           ("M-c", changeDir promptConfig),
           ("M-S-s", namedScratchpadAction scratchpads "pavucontrol"),
           ("M-i", namedScratchpadAction scratchpads "hexchat"),
           ("M-s", namedScratchpadAction scratchpads "slack"),
           ("M-w", namedScratchpadAction scratchpads "vimwiki"),
           ("M-d", namedScratchpadAction scratchpads "dashboard-personal"),
           ("M-S-d", namedScratchpadAction scratchpads "dashboard-stuart")
         ]

scratchpads :: [NamedScratchpad]
scratchpads = [
                NS "vifm" "kitty --class vifm vifm" (resource =? "vifm") centered,
                NS "vimwiki" "kitty --class vimwiki nvim -c ':VimwikiIndex'" (resource =? "vimwiki") centered,
                NS "pavucontrol" "pavucontrol" (resource =? "pavucontrol") centeredSmall,
                NS "hexchat" "hexchat" (resource =? "hexchat") centered,
                NS "slack" "slack" (resource =? "slack") centered,
                NS "dashboard-personal" "kitty --class dashboard-personal wtfutil --config=~/.dotfiles/config/wtf/personal.yml" (resource =? "dashboard-personal") centered,
                NS "dashboard-stuart" "kitty --class dashboard-stuart wtfutil --config=~/.dotfiles/config/wtf/stuart.yml" (resource =? "dashboard-stuart") centered
              ]
              where
                centered = customFloating $ W.RationalRect 0.05 0.05 0.9 0.9
                centeredSmall = customFloating $ W.RationalRect l t w h
                  where
                    h = 0.6       -- height, 60%DDD
                    w = 0.6       -- width, 60%
                    t = (1 - h)/2 -- centered top/bottom
                    l = (1 - w)/2 -- centered left/right

myTerminal :: String
myTerminal = "kitty"

myModMask :: KeyMask
myModMask = mod4Mask -- Win key or Super_L

myBorderWidth :: Dimension
myBorderWidth = 3

myLayouts = workspaceDir "~" $ avoidStruts $ spacing 15 $ ThreeColMid 1 (3/100) (1/2) ||| ThreeCol 1 (3/100) (1/2) ||| Grid ||| Tall 1 (3/100) (1/2) ||| Full

myStartupHook = do
  spawnHere "feh --randomize --bg-fill ~/Pictures/Wallpapers"
  setWMName "LG3D"

promptConfig = defaultXPConfig
    { font = "xft:Monego:18"
    , bgColor  = solbase03
    , fgColor  = solbase1
    , bgHLight = solyellow
    , fgHLight = solbase02
    , promptBorderWidth = 0
    , height   = 30
    , historyFilter = nub
    , showCompletionOnTab = True
    }

-- solarized color palette
solbase03  = "#002b36"
solbase02  = "#073642"
--solbase01  = "#586e75"
--solbase00  = "#657b83"
--solbase0   = "#839496"
solbase1   = "#93a1a1"
--solbase2   = "#eee8d5"
--solbase3   = "#fdf6e3"
solyellow  = "#b58900"
--solorange  = "#cb4b16"
--solred     = "#dc322f"
--solmagenta = "#d33682"
--solviolet  = "#6c71c4"
--solblue    = "#268bd2"
--solcyan    = "#2aa198"
--solgreen   = "#859900"
