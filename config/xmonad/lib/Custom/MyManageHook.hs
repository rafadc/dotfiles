module Custom.MyFixToScreen where

import Xmonad.Hooks.ManageDocks
import XMonad (ManageHook, composeAll)

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "obs" --> doShift "9"
  , manageDocks
  ]


