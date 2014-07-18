import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig (additionalKeys)

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 0

main = do
  xmonad $ defaultConfig
    { manageHook  = manageDocks <+> manageHook defaultConfig
    , layoutHook  = avoidStruts  $  layoutHook defaultConfig
    , terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    } `additionalKeys` myKeys

myKeys =
  [ ((mod4Mask,  xK_p  ), spawn "dmenu_run -fn Cantarell-11 -nb black -nf '#ebdbb2'")
  , ((shiftMask .|. mod4Mask,  xK_l  ), spawn "slimlock")
  ]