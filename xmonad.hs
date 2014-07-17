import XMonad
import XMonad.Util.Run (spawnPipe)

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/viszu/.xmobarrc"
  xmonad $ defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    }

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 1
