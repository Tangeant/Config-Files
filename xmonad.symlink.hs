import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog

baseConfig = desktopConfig

main = xmonad baseConfig
  xmonad $ defaultConfig
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    }

myTerminal    = "roxterm"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 3
