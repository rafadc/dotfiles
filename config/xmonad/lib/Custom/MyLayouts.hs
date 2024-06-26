{-# OPTIONS_GHC -Wno-missing-signatures #-}

module Custom.MyLayouts where

import Custom.MyDecorations
import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Accordion
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.BoringWindows
import XMonad.Layout.Column
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.PerScreen
import XMonad.Layout.Renamed as XLR
import XMonad.Layout.ResizableTile
import XMonad.Layout.ShowWName
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed
import XMonad.Layout.ToggleLayouts (ToggleLayout(..), toggleLayouts)
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ThreeColumns

mySpacing i = spacingRaw False (Border 10 10 30 30) True (Border i i i i) True

tabs =
  renamed [XLR.Replace "Tabs"] $
    avoidStruts $
      tabbed
        shrinkText
        myTabConfig

tall =
  renamed [XLR.Replace "Tall"] $
    avoidStruts $
      windowNavigation $
        addTabs shrinkText myTabConfig $
          subLayout [] tabs $
            mySpacing 7 $
              ResizableTall nmaster delta ratio []
  where
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

column =
  renamed [XLR.Replace "Column"] $
    avoidStruts $
      windowNavigation $
        addTabs shrinkText myTabConfig $
          subLayout [] tabs $
            mySpacing 7 $
              Column 1.0

threeColumns =
  renamed [XLR.Replace "ThreeCol"] $
    avoidStruts $
      windowNavigation $
        addTabs shrinkText myTabConfig $
          subLayout [] tabs $
            mySpacing 7 $
              ThreeColMid 1 (3 / 100) (1 / 2)

full = renamed [XLR.Replace "Full"] $ noBorders Full

myLayout = toggleLayouts (noBorders Full) (myTiled ||| myTabbed)
  where
    myTiled = boringWindows
      (ifWider 1080 (tall ||| column ||| threeColumns) (full))
    myTabbed = noBorders $ tabbedAlways shrinkText myTabConfig

myLayoutHook =
  showWName' myShowWNameConfig $
    smartBorders $
      mkToggle
        (NOBORDERS ?? FULL ?? EOT)
        myLayout
