module Custom.MyKeys where

import XMonad (spawn, X, sendMessage)
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)

myKeys :: [(String, X ())]
myKeys =
  [
    ("M-q", spawn "xmonad --recompile && xmonad --restart")
  , ("M-t", spawn "rofimoji")
  , ("M-f", sendMessage (Toggle "Full"))
  ]
