import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig (additionalKeys)

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 0
myNormalBorderColor = "#000000"
myFocusedBorderColor = "#99ccff"

myManageHook = composeAll
  -- Open in workspace "x"
  [ className =? "Pidgin" --> doShift "2"
  , className =? "Spotify" --> doShift "2"
  , className =? "Rhythmbox" --> doShift "2"
  , className =? "Transmission-gtk" --> doShift "2"
  , className =? "Google-chrome-stable" --> doShift "2"
  , className =? "Googleearth-bin" --> doShift "2"
  -- Float those
  , className =? "Viewnior" --> doFloat
  , className =? "MuPDF" --> doFloat
  , className =? "Gvim" --> doFloat
  , className =? "Vlc" --> doFloat
  , manageDocks
  ]

main = do
  xmonad $ defaultConfig
    { manageHook = myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , terminal = myTerminal
    , modMask = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    } `additionalKeys` myKeys

myKeys =
  [ ((mod4Mask,  xK_p  ), spawn "dmenu_run -fn 'Roboto Medium-10' -nb black -nf '#ebdbb2'")
  , ((shiftMask .|. mod4Mask,  xK_l  ), spawn "slimlock")
  , ((mod4Mask , xK_Print ), spawn "scrot -q 100 ~/pics/screens/%Y-%m-%d-%H-%M-%S.png")
  , ((mod4Mask,  xK_Delete  ), spawn "xkill" )
  , ((mod4Mask,  xK_b  ), sendMessage ToggleStruts)
  ]
