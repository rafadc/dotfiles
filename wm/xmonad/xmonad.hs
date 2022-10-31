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
  xmonad $ def
    {
      XMonad.workspaces  = ["1","2","3","4","5","6","7","8","9","0","-","="]
    , terminal    = myTerminal
    , modMask     = mod4Mask
    , normalBorderColor  = fgColor promptConfig
    , focusedBorderColor = bgColor promptConfig
    , borderWidth = myBorderWidth
    , layoutHook  = myLayouts
    , startupHook = myStartupHook
    , manageHook  = namedScratchpadManageHook scratchpads
    } `additionalKeysP` myKeys

myKeys = [
           ("M-p", spawn "rofi -show run"),
           ("C-<space>", spawn "rofi -show run"),
           ("M-S-p", spawn "dmenu_run"),
           ("<Print>", spawn "flameshot gui"),
           ("M-n", namedScratchpadAction scratchpads "xplr"),
           ("M-S-n", spawn "wezterm start --class xplr xplr ~"),
           ("M-f", spawn "rofimoji"),
           ("M-c", changeDir promptConfig),
           ("M-S-s", namedScratchpadAction scratchpads "pavucontrol"),
           ("M-s", namedScratchpadAction scratchpads "slack"),
           ("M-S-d", namedScratchpadAction scratchpads "ytop"),
           ("M-b", namedScratchpadAction scratchpads "bitwarden")
         ]

scratchpads :: [NamedScratchpad]
scratchpads = [
                NS "xplr" "wezterm start --class xplr xplr" (resource =? "xplr") centered,
                NS "pavucontrol" "pavucontrol" (resource =? "pavucontrol") centeredSmall,
                NS "slack" "slack" (resource =? "slack") centered,
                NS "ytop" "wezterm start --class ytop ytop -b -s" (resource =? "ytop") centered,
                NS "bitwarden" "bitwarden" (resource =? "bitwarden") centered
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
myTerminal = "wezterm"

myBorderWidth :: Dimension
myBorderWidth = 3

myLayouts = workspaceDir "~" $ avoidStruts $ spacing 15 $ ThreeColMid 1 (3/100) (1/2) ||| ThreeCol 1 (3/100) (1/2) ||| Grid ||| Tall 1 (3/100) (1/2) ||| Full

myStartupHook = do
  spawnHere "feh --bg-fill ~/.xmonad/images/wallpaper.webp"
  setWMName "LG3D"
  spawnHere "dunst"
  spawnHere "sh ~/.xmonad/polybar.sh"

promptConfig = def
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
