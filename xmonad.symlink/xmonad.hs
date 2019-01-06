import System.IO
import System.Exit

import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers(doFullFloat, doCenterFloat, isFullscreen, isDialog)
import XMonad.Config.Desktop
--import XMonad.Config.Azerty
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdatePointer
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Actions.CycleWS
import XMonad.Hooks.UrgencyHook
import qualified Codec.Binary.UTF8.String as UTF8

import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Cross(simpleCross)
import XMonad.Layout.Spiral(spiral)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.IndependentScreens


import XMonad.Layout.CenteredMaster(centerMaster)

import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import qualified Data.ByteString as B
import Control.Monad (liftM2)
import qualified DBus as D
import qualified DBus.Client as D


myStartupHook = do
    spawn "$HOME/.xmonad/scripts/autostart.sh"
    setWMName "LG3D"

-- colours
normBord = "#4c566a"
focdBord = "#5e81ac"
fore     = "#DEE3E0"
back     = "#282c34"
winType  = "#c678dd"

-- define options
myModMask = mod4Mask
encodeCChar = map fromIntegral . B.unpack
myFocusFollowsMouse = True
myBorderWidth = 2
myTerminal = "urxvt"
-- myTerminal = "termite"
myWorkspaces    = ["\61612","\61899","\61947","\61635","\61502","\61501","\61705","\61564","\62150","\61872"]
--myWorkspaces    = ["1","2","3","4","5","6","7","8","9","10"]
myBaseConfig = desktopConfig
scratchPad = scratchpadSpawnActionTerminal myTerminal

-- window manipulations
myManageHook = composeAll . concat $
    [ [isDialog --> doFloat]
    , [className =? c --> doCenterFloat | c <- myCFloats]
    , [title =? t --> doFloat | t <- myTFloats]
    , [resource =? r --> doFloat | r <- myRFloats]
    , [resource =? i --> doIgnore | i <- myIgnores]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61612" | x <- my1Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61899" | x <- my2Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61947" | x <- my3Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61635" | x <- my4Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61502" | x <- my5Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61501" | x <- my6Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61705" | x <- my7Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61564" | x <- my8Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\62150" | x <- my9Shifts]
    -- , [(className =? x <||> title =? x <||> resource =? x) --> doShiftAndGo "\61872" | x <- my10Shifts]
  ]
    where
    -- doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift
    myCFloats = ["Arandr", "Galculator", "Oblogout", "feh", "mpv"]
    myTFloats = ["Downloads", "Save As..."]
    myRFloats = []
    myIgnores = ["desktop_window"]
    my1Shifts = ["Chromium", "Vivaldi-stable", "Firefox", "Qutebrowser"]
    my2Shifts = ["termite", "urxvt"]
    my3Shifts = ["Inkscape"]
    my4Shifts = ["kate", "geany"]
    my5Shifts = ["Gimp", "feh"]
    my6Shifts = ["vlc", "mpv"]
    -- my7Shifts = ["Virtualbox"]
    my8Shifts = ["Thunar"]
    my9Shifts = ["thunderbird"]
    -- my10Shifts = ["discord"]
    
-- Scratchpad definition
manageScratchPad :: ManageHook

manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)

    where
        
        h = 0.1     -- terminal height, 10%
        w = 0.8       -- terminal width, 100%
        t = 1 - h   -- distance from top edge, 90%
        l = 1 - w   -- distance from left edge, 0%

-- pointer follows focus logHook
myLogHook = dynamicLogWithPP defaultPP { ppSort = fmap (.scratchpadFilterOutWorkspace) getSortByTag
    --ppHidden  =   noScratchPad
   -- , ppHiddenNoWindows = noScratchPad
    } 
    >> updatePointer (0.5,0.5) (0,0)
       -- where
        -- define the noScratchPad function if workspace is NSP then print nothing, else print it as-is
         --   noScratchPad ws = if ws == "NSP" then "" else ws

----------------------------------------------------------------------------------------------------------------
-- Define Layout
myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True $ avoidStruts $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) $ smartBorders tiled ||| smartBorders (Mirror tiled) ||| spiral (6/7)  ||| ThreeColMid 1 (3/100) (1/2) ||| noBorders Full
    where
        tiled = Tall nmaster delta tiled_ratio
        nmaster = 1
        delta = 3/100
        tiled_ratio = 1/2

-- Define Mouse Bindings
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modMask, 1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modMask, 2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modMask, 3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))

    ]


-- keys config

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  ----------------------------------------------------------------------
  -- SUPER + FUNCTION KEYS

  [ ((modMask, xK_e), spawn $ "geany" )
  , ((modMask, xK_f), sendMessage $ Toggle NBFULL)
  , ((modMask, xK_h), spawn $ "urxvt 'htop task manager' -e htop" )
  , ((modMask, xK_m), spawn $ "pragha" )
  , ((modMask, xK_p), spawn $ "termite -e pacli" )
  , ((modMask, xK_b), spawn $ "termite -e bmenu" )
  , ((modMask, xK_t), spawn $ "urxvt" )
  , ((modMask, xK_r), spawn $ "termite -e ranger" )
  , ((modMask, xK_w), spawn $ "pavucontrol" )
  , ((modMask, xK_v), spawn $ "vivaldi-stable" )
  , ((modMask, xK_q), spawn $ "qutebrowser" )
  , ((modMask, xK_y), spawn $ "polybar-msg cmd toggle" )
  , ((modMask, xK_x), spawn $ "oblogout" )
--  , ((modMask, xK_Escape), spawn $ "xkill" )
  , ((modMask, xK_c), spawn $ "xkill" )
--  , ((modMask, xK_Return), spawn $ "urxvt" )
  , ((modMask, xK_Return), spawn $ "termite -e tmux" )
  , ((modMask, xK_s), scratchPad)
  , ((modMask, xK_F1), spawn $ "vivaldi-stable" )
  , ((modMask, xK_F2), spawn $ "geany" )
  , ((modMask, xK_F3), spawn $ "inkscape" )
  , ((modMask, xK_F4), spawn $ "gimp" )
  , ((modMask, xK_F5), spawn $ "meld" )
  , ((modMask, xK_F6), spawn $ "vlc --video-on-top" )
  , ((modMask, xK_F7), spawn $ "virtualbox" )
  , ((modMask, xK_F8), spawn $ "thunar" )
  , ((modMask, xK_F9), spawn $ "thunderbird" )
  , ((modMask, xK_F10), spawn $ "spotify" )
  , ((modMask, xK_F11), spawn $ "rofi -show run -fullscreen" )
  , ((modMask, xK_F12), spawn $ "rofi -m -1 -threads 0 -modi run,window,drun -show run -show-icons" )

  -- SUPER + SHIFT KEYS

  , ((modMask .|. shiftMask , xK_Return ), spawn $ "tabbed -r 2 st -w '' -e tmux")
  , ((modMask .|. shiftMask, xK_r ), spawn $ "termite -e 'sudo ranger'")
  , ((modMask .|. shiftMask , xK_d ), spawn $ "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")
  , ((modMask .|. shiftMask , xK_p ), spawn $ "rofi -m -1 -threads 0 -modi run,window,drun -show run -show-icons")
  , ((modMask .|. shiftMask , xK_Escape ), spawn $ "xmonad --recompile && xmonad --restart")
  , ((modMask .|. shiftMask , xK_q ), kill)
  , ((modMask .|. shiftMask , xK_x ), io (exitWith ExitSuccess))

  -- CONTROL + ALT KEYS

  , ((controlMask .|. mod1Mask , xK_a ), spawn $ "xfce4-appfinder")
  , ((controlMask .|. mod1Mask , xK_b ), spawn $ "thunar")
  , ((controlMask .|. mod1Mask , xK_c ), spawn $ "catfish")
  , ((controlMask .|. mod1Mask , xK_e ), spawn $ "kate")
  , ((controlMask .|. mod1Mask , xK_f ), spawn $ "firefox")
--   , ((controlMask .|. mod1Mask , xK_g ), spawn $ "chromium -no-default-browser-check")
  , ((controlMask .|. mod1Mask , xK_g ), spawn $ "tabbed surf -e") 
  , ((controlMask .|. mod1Mask , xK_i ), spawn $ "nitrogen")
  , ((controlMask .|. mod1Mask , xK_l ), spawn $ "i3lock")
  , ((controlMask .|. mod1Mask , xK_m ), spawn $ "xfce4-settings-manager")
  , ((controlMask .|. mod1Mask , xK_o ), spawn $ "$HOME/.xmonad/scripts/compton-toggle.sh")
  , ((controlMask .|. mod1Mask , xK_p ), spawn $ "pamac-manager")
  , ((controlMask .|. mod1Mask , xK_r ), spawn $ "rofi-theme-selector")
  , ((controlMask .|. mod1Mask , xK_s ), spawn $ "spotify")
  , ((controlMask .|. mod1Mask , xK_t ), spawn $ "tabbed -r 2 st -w '' -e tmux")
  , ((controlMask .|. mod1Mask , xK_u ), spawn $ "pavucontrol")
  , ((controlMask .|. mod1Mask , xK_v ), spawn $ "vivaldi-stable")
  , ((controlMask .|. mod1Mask , xK_w ), spawn $ "evolution")
  , ((controlMask .|. mod1Mask , xK_Return ), spawn $ "termite")

  -- ALT + ... KEYS

  , ((mod1Mask, xK_f), spawn $ "variety -f" )
  , ((mod1Mask, xK_n), spawn $ "variety -n" )
  , ((mod1Mask, xK_p), spawn $ "variety -p" )
  , ((mod1Mask, xK_r), spawn $ "xmonad --restart" )
  , ((mod1Mask, xK_t), spawn $ "variety -t" )
  , ((mod1Mask, xK_Up), spawn $ "variety --pause" )
  , ((mod1Mask, xK_Down), spawn $ "variety --resume" )
  , ((mod1Mask, xK_Left), spawn $ "variety -p" )
  , ((mod1Mask, xK_Right), spawn $ "variety -n" )
  , ((mod1Mask, xK_F2), spawn $ "gmrun" )
  , ((mod1Mask, xK_F3), spawn $ "xfce4-appfinder" )

  --VARIETY KEYS WITH PYWAL

  , ((mod1Mask .|. shiftMask , xK_f ), spawn $ "variety -f && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&")
  , ((mod1Mask .|. shiftMask , xK_n ), spawn $ "variety -n && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&")
  , ((mod1Mask .|. shiftMask , xK_p ), spawn $ "variety -p && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&")
  , ((mod1Mask .|. shiftMask , xK_t ), spawn $ "variety -t && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&")
  , ((mod1Mask .|. shiftMask , xK_u ), spawn $ "wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&")

  --CONTROL + SHIFT KEYS

  , ((controlMask .|. shiftMask , xK_Escape ), spawn $ "xfce4-taskmanager")

  --SCREENSHOTS

  , ((0, xK_Print), spawn $ "scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")
  , ((controlMask, xK_Print), spawn $ "xfce4-screenshooter" )
  , ((controlMask .|. shiftMask , xK_Print ), spawn $ "gnome-screenshot -i")


  --MULTIMEDIA KEYS

  -- Mute volume
  , ((0, xF86XK_AudioMute), spawn $ "amixer -q set Master toggle")

  -- Decrease volume
  , ((0, xF86XK_AudioLowerVolume), spawn $ "amixer -q set Master 10%-")

  -- Increase volume
  , ((0, xF86XK_AudioRaiseVolume), spawn $ "amixer -q set Master 10%+")

  -- Increase brightness
  , ((0, xF86XK_MonBrightnessUp),  spawn $ "xbacklight -inc 10")

  -- Decrease brightness
  , ((0, xF86XK_MonBrightnessDown), spawn $ "xbacklight -dec 10")

  , ((0, xF86XK_AudioPlay), spawn $ "mpc toggle")
  , ((0, xF86XK_AudioNext), spawn $ "mpc next")
  , ((0, xF86XK_AudioPrev), spawn $ "mpc prev")
  , ((0, xF86XK_AudioStop), spawn $ "mpc stop")

--  , ((0, xF86XK_AudioPlay), spawn $ "playerctl play-pause")
--  , ((0, xF86XK_AudioNext), spawn $ "playerctl next")
--  , ((0, xF86XK_AudioPrev), spawn $ "playerctl previous")
--  , ((0, xF86XK_AudioStop), spawn $ "playerctl stop")

  --------------------------------------------------------------------
  --  XMONAD LAYOUT KEYS

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space), sendMessage NextLayout)

  --Focus empty workspaces, except scratchPad
  , ((controlMask, xK_Tab), moveTo Next EmptyWS)

  --Focus non-empty workspaces, except scratchPad
  , ((modMask, xK_Tab), moveTo Next (WSIs notNSP))

  --Toggle previously displayed workspace
  , ((mod1Mask, xK_Tab), toggleWS' ["NSP"])

  --  Reset the layouts on the current workspace to default.
  , ((controlMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

  -- Move focus to the next window.
  , ((controlMask .|. mod1Mask , xK_Left ), windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j), windows W.focusDown)

  -- Move focus to the previous window.
  , ((controlMask .|. mod1Mask , xK_Right ), windows W.focusUp)

  -- Move focus to the previous window.
  , ((modMask, xK_k), windows W.focusUp)

  -- Move focus to the master window.
  , ((modMask .|. shiftMask, xK_m), windows W.focusMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j), windows W.swapDown)

  -- Swap the focused window with the next window.
  , ((controlMask .|. modMask, xK_Down), windows W.swapDown)

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k), windows W.swapUp)

  -- Swap the focused window with the previous window.
  , ((controlMask .|. modMask, xK_Up), windows W.swapUp)

  -- Shrink the master area.
  , ((modMask .|. shiftMask , xK_h), sendMessage Shrink)

  -- Expand the master area.
  , ((modMask .|. shiftMask , xK_l), sendMessage Expand)

  -- Push window back into tiling.
  , ((controlMask .|. shiftMask , xK_t), withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((controlMask .|. modMask, xK_Left), sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((controlMask .|. modMask, xK_Right), sendMessage (IncMasterN (-1)))

  -- Swap the focused window with the master window
  , ((modMask .|. shiftMask , xK_space), windows W.swapMaster)

  -- Move focus to the master window
  , ((modMask .|. controlMask , xK_space), windows W.focusMaster)
  ]

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  ++[((m .|. modMask, k), windows $ f i)

  --Keyboard layouts
  --qwerty users use this line
   | (i, k) <- zip (XMonad.workspaces conf) [xK_1,xK_2,xK_3,xK_4,xK_5,xK_6,xK_7,xK_8,xK_9,xK_0]

  --French Azerty users use this line
  -- | (i, k) <- zip (XMonad.workspaces conf) [xK_ampersand, xK_eacute, xK_quotedbl, xK_apostrophe, xK_parenleft, xK_minus, xK_egrave, xK_underscore, xK_ccedilla , xK_agrave]

  --Belgian Azerty users use this line
  -- | (i, k) <- zip (XMonad.workspaces conf) [xK_ampersand, xK_eacute, xK_quotedbl, xK_apostrophe, xK_parenleft, xK_section, xK_egrave, xK_exclam, xK_ccedilla, xK_agrave]

      , (f, m) <- [(W.toggleOrView, 0), (W.shift, shiftMask)]
  ]  ++
  -- mod-{comma,period,slash}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{comma,period,slash}, Move client to screen 1, 2, or 3
  [ ((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_comma, xK_period] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]

  -- where clause for skipping scratchPad workspace
  ]
  where
      notNSP = (return $ ("NSP" /=) . W.tag, NonEmptyWS) :: X (WindowSpace -> Bool)

---------------------------------------------------------------------------------------------------
--MAIN
---------------------------------------------------------------------------------------------------

main :: IO ()
main = do

    dbus <- D.connectSession
    -- Request access to the DBus name
    D.requestName dbus (D.busName_ "org.xmonad.Log")
        [D.nameAllowReplacement, D.nameReplaceExisting, D.nameDoNotQueue]


    xmonad . ewmh $
  --Keyboard layouts
  --qwerty users use this line
            myBaseConfig
  --French Azerty users use this line
            --myBaseConfig { keys = azertyKeys <+> keys azertyConfig }
  --Belgian Azerty users use this line
            --myBaseConfig { keys = belgianKeys <+> keys belgianConfig }

                {startupHook = myStartupHook
, layoutHook = gaps [(U,35), (D,5), (R,5), (L,5)] $ myLayout ||| layoutHook myBaseConfig
, manageHook = manageSpawn <+> manageScratchPad <+> myManageHook <+> manageHook myBaseConfig
, modMask = myModMask
, borderWidth = myBorderWidth
, handleEventHook    = handleEventHook myBaseConfig <+> fullscreenEventHook
, focusFollowsMouse = myFocusFollowsMouse
, logHook = myLogHook
, workspaces = myWorkspaces
, focusedBorderColor = focdBord
, normalBorderColor = normBord
, keys = myKeys
, mouseBindings = myMouseBindings
}