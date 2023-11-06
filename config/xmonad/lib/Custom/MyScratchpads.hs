{-# LANGUAGE ImportQualifiedPost #-}

module Custom.MyScratchpads where

import XMonad.Core (X)
import XMonad.ManageHook
import XMonad.StackSet qualified as W
import XMonad.Util.NamedScratchpad

myScratchpads :: [NamedScratchpad]
myScratchpads =
  [ NS "obsidian" "obsidian" (className =? "obsidian") myCenter,
    NS "obs" "obs --startvirtualcam" (className =? "obs") myCenter
  ]

myScratchpadKeys :: [(String, XMonad.Core.X ())]
myScratchpadKeys =
  [ ("M-o", namedScratchpadAction myScratchpads "obsidian"),
    ("M-s", namedScratchpadAction myScratchpads "obs")
  ]

myCenter = customFloating $ W.RationalRect fromLeft fromTop width height
  where
    width = 3 / 4
    height = 3 / 4
    fromLeft = (1 - width) / 2
    fromTop = (1 - height) / 2

myCenterSmall = customFloating $ W.RationalRect fromLeft fromTop width height
  where
    width = 1 / 2
    height = 1 / 2
    fromLeft = (1 - width) / 2
    fromTop = (1 - height) / 2
