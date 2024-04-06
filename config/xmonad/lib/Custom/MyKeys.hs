module Custom.MyKeys where

import XMonad (spawn, X, sendMessage, def, io)
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Prompt.ConfirmPrompt
import System.Exit (exitSuccess)

myKeys :: [(String, X ())]
myKeys =
  [
    ("M-q", spawn "xmonad --recompile && xmonad --restart")
  , ("M-S-q", confirmPrompt def "exit" $ io exitSuccess)
  , ("M-y", spawn "rofimoji")
  , ("M-f", sendMessage (Toggle "Full"))
  , ("M-n", spawn "kitty --name vifm -e vifm")
  , ("M-p", spawn "rofi -show run")
  ]
