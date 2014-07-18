import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/viszu/.xmobarrc"
  xmonad $ defaultConfig
    { manageHook  = manageDocks <+> manageHook defaultConfig
    , layoutHook  = avoidStruts  $  layoutHook defaultConfig
    , terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    }

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 0
