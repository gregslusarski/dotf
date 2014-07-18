import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig (additionalKeys)

main = do
  xmonad $ defaultConfig
    { manageHook  = manageDocks <+> manageHook defaultConfig
    , layoutHook  = avoidStruts  $  layoutHook defaultConfig
    , terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    } `additionalKeys`
    [ ((mod4Mask,  xK_p  ), spawn "dmenu_run -fn Cantarell-11 -nb black -nf '#ebdbb2'") ]

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 0
