module Custom.MyKeys where

import XMonad
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)

myKeys :: [(String, X ())]
myKeys = 
  [
    ("M-q", spawn "xmonad --recompile && xmonad --restart")        
  , ("M-f", sendMessage (Toggle "Full"))
  ]
