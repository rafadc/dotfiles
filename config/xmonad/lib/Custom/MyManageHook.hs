module Custom.MyManageHook where

import Custom.MyScratchpads (myScratchpads)

import XMonad.Hooks.ManageDocks
import XMonad (ManageHook, composeAll)
import XMonad.ManageHook
import XMonad.Hooks.ManageHelpers

import XMonad.Util.NamedScratchpad (namedScratchpadManageHook)

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "obs" --> doShift "9"
  , namedScratchpadManageHook myScratchpads
  , manageDocks
  , isDialog --> doCenterFloat
  ]


