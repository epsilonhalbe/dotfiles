import Control.Monad (liftM2)
import Data.Monoid
-- import Data.Ratio

import qualified Data.Map as M

import System.Exit
import System.IO

import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Actions.CycleWS
-- import XMonad.Actions.FloatKeys
-- import XMonad.Actions.FloatSnap
-- import XMonad.Actions.SpawnOn
-- import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
-- import XMonad.Hooks.SetWMName
-- import XMonad.Hooks.EwmhDesktops
-- import XMonad.Hooks.ManageHelpers

import qualified XMonad.Layout.HintedGrid as HGrid
import XMonad.Layout.Accordion
import XMonad.Layout.CenteredMaster
-- {-import XMonad.Layout.Circle-}
import XMonad.Layout.Cross
-- {-import XMonad.Layout.Dishes-}
-- {-import XMonad.Layout.Drawer-}
-- {-import XMonad.Layout.Gaps-}
import XMonad.Layout.Grid
import XMonad.Layout.IM
-- {-import XMonad.Layout.MagicFocus-}
-- import XMonad.Layout.Magnifier
-- {-import XMonad.Layout.MosaicAlt-}
-- import XMonad.Layout.NoBorders
import XMonad.Layout.OneBig
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
-- {-import XMonad.Layout.ResizableTile-}
import XMonad.Layout.Roledex
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
-- import XMonad.Layout.Spiral
-- import XMonad.Layout.StackTile
import XMonad.Layout.Tabbed
{-import XMonad.Layout.WorkspaceDir-}

import qualified XMonad.StackSet as W
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Replace
import Graphics.X11.ExtraTypes.XorgDefault (xK_dead_grave)
-- import XMonad.Util.EZConfig


-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.

myTerminal :: String
myTerminal = "gnome-terminal"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Width of the window border in pixels.
myBorderWidth :: Dimension
myBorderWidth = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
-- myModMask       = mod4Mask
myModMask :: KeyMask
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
-- A tagging example:
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces :: [String]
myWorkspaces    = [ "^ vim"
                  , "1 /"
                  , "2 pdf"
                  , "3 web"
                  , "4 file"
                  , "5 radio"
                  , "6 mail"
                  , "7 vlc"
                  , "8 grfx"
                  , "9 chat"
                  , "0 emacs"
                  , "- foo"
                  , "` bar"
                  , "⌫ baz"
                  ]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor :: String
myNormalBorderColor  = "#000000"
{-myNormalBorderColor  = "#1D1D1D"-}

myFocusedBorderColor :: String
{-myFocusedBorderColor = "#FFA71A" -- Day[9]'s yellow :-)-}
myFocusedBorderColor = "#F92672"   -- molokai purple
{-myFocusedBorderColor = "#1D1D1D"-}

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal/dmenu/gmrun
    [ ((modm .|. shiftMask, xK_F1     ), spawn $ XMonad.terminal conf)
    , ((modm,               xK_F1     ), spawn "gvim --servername GVIM" >>
                                         spawn "notify-send -t 1000 -i ~/prgrms/vim-icon.png gVim" >>
                                         focusUrgent)
    {-, ((modm,               xK_F2     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")-}
    , ((modm,               xK_F2     ), spawn "exe=`~/bin/yeganesh` && eval \"exec $exe\"")
    , ((modm,               xK_F3     ), spawn "gmrun")

    -- close focused window
    , ((mod1Mask,               xK_F4     ), kill1)
    , ((modm .|. shiftMask, xK_c      ), kill1)

     -- Rotate through the available layout algorithms
    , ((modm .|. shiftMask, xK_space  ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm              , xK_Escape), setLayout $ XMonad.layoutHook conf)
    -- on laptop disabling the touchpad is quite handy
    , ((modm              , xK_space  ), spawn "synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')")

--  -- Resize viewed windows to the correct size
--  , ((modm,               xK_n      ), refresh)

    -- Move focus to the next/previous window
    , ((mod1Mask,               xK_Tab    ), windows W.focusDown)
    , ((mod1Mask .|. shiftMask, xK_Tab    ), windows W.focusUp)

    -- Move window to the next/previous position
    , ((modm,               xK_Tab    ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_Tab    ), windows W.swapUp)

    -- Move focus to the master window
    , ((modm,               xK_m      ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    -- , ((modm,               xK_u      ), windows W.swapMaster)

    -- Swap the focused window and the master window
    , ((modm,               xK_Return ), windows W.swapMaster)

--  -- Swap the focused window with the next window
--  , ((modm .|. shiftMask, xK_i      ), windows W.swapDown  )
--
--  -- Swap the focused window with the previous window
--  , ((modm .|. shiftMask, xK_a      ), windows W.swapUp    )

    -- Shrink/Expand the master area
    , ((modm,               xK_period), sendMessage Shrink)
    , ((modm,               xK_comma ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,                   xK_j      ), withFocused $ windows . W.sink)
    --, ((modm     .|. shiftMask, xK_Left   ), withFocused $ keysMoveWindow (-10,0))
    --, ((modm     .|. shiftMask, xK_Up     ), withFocused $ keysMoveWindow (0,-10))
    --, ((modm     .|. shiftMask, xK_Right  ), withFocused $ keysMoveWindow (10,0))
    --, ((modm     .|. shiftMask, xK_Down   ), withFocused $ keysMoveWindow (0,10))
    --, ((mod4Mask .|. shiftMask, xK_Left   ), withFocused $ keysResizeWindow (-10,0)   (1%2,1%2))
    --, ((mod4Mask .|. shiftMask, xK_Up     ), withFocused $ keysResizeWindow (0  ,-10) (1%2,1%2))
    --, ((mod4Mask .|. shiftMask, xK_Right  ), withFocused $ keysResizeWindow (10 ,0)   (1%2,1%2))
    --, ((mod4Mask .|. shiftMask, xK_Down   ), withFocused $ keysResizeWindow (0  ,20) (1%2,1%2))
    --, ((mod4Mask,               xK_Left),  withFocused $ snapMove L Nothing)
    --, ((mod4Mask,               xK_Right), withFocused $ snapMove R Nothing)
    --, ((mod4Mask,               xK_Up),    withFocused $ snapMove U Nothing)
    --, ((mod4Mask,               xK_Down),  withFocused $ snapMove D Nothing)
    --, ((mod4Mask .|. shiftMask, xK_Left),  withFocused $ snapShrink R Nothing)
    --, ((mod4Mask .|. shiftMask, xK_Right), withFocused $ snapGrow R Nothing)
    --, ((mod4Mask .|. shiftMask, xK_Up),    withFocused $ snapShrink D Nothing)
    --, ((mod4Mask .|. shiftMask, xK_Down),  withFocused $ snapGrow D Nothing)
--    , ((modm,               xK_J      ), withFocused $ \w -> focus w >> mouseResizeWindow w
--                                                                    >> windows W.shiftMaster)
    , ((modm                  , xK_v      ), windows copyToAll) -- @@ Make focused window always visible
    , ((modm .|. shiftMask    , xK_v      ), killAllOtherCopies) -- @@ Toggle window state back
    -- De/Increment the number of windows in the master area
    , ((modm .|. shiftMask, xK_period), sendMessage (IncMasterN 1))
    , ((modm .|. shiftMask, xK_comma ), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b   ), sendMessage ToggleStruts)
    -- Quit xmonad
    , ((modm .|. shiftMask   , xK_Delete ), io exitSuccess)

    {-, ((modm .|. shiftMask   , xK_Delete), spawn "gnome-session-quit")-}

    -- Restart xmonad
    , ((modm                 , xK_F5  ), spawn "xmonad --recompile && xmonad --restart")

    -- Screensaver
    {-, ((modm                 , xK_l   ), spawn "qdbus org.gnome.ScreenSaver /ScreenSaver Lock")-}
    {-, ((modm                 , xK_l   ), spawn "export DISPLAY=:0 && gnome-screensaver-command --lock" >> safeSpawn "notify-send" ["my","message"])-}
    {-, ((modm                 , xK_l   ), spawn "notify-send lock lock" )-}
    , ((modm                 , xK_l   ), spawn "slock" )

    -- VolumeControl
    -- , ((mod4Mask             , xK_v   ), spawn "xfce4-mixer")

    -- FileManager
    {-, ((modm                   , xK_f   ), spawn "thunar")-}
    , ((modm                   , xK_f   ), spawn "nautilus")
    , ((modm .|. shiftMask     , xK_f   ), spawn "pcmanfm")

    -- Opera
    , ((modm                  , xK_w   ), spawn "opera")
    , ((modm     .|. shiftMask, xK_w   ), spawn "opera-next")

    -- make ScreenPicture in .2 seconds
    , ((controlMask .|. shiftMask , xK_Print), spawn "sleep 0.2; scrot -s")

    -- make ScreenPicture NOW
    , ((controlMask               , xK_Print), spawn "scrot")
    {-, ((controlMask               , xK_Print), spawn "scrot -u")-}

    -- Special Keys

    -- XF68XK_AudioMute
    , ((0             , muteButton), spawn "amixer -q set Master toggle")
    , ((shiftMask     , muteButton), spawn "amixer -q set Front toggle; amixer -q set Side toggle; amixer -q set Surround toggle")
    -- MPD
--    {-playpause-}
    , ((0             , playButton), spawn "mpc toggle")
    , ((modm          , xK_Right  ), spawn "mpc next")
    , ((modm          , xK_Left   ), spawn "mpc prev")
    -- Guayadeque
--    {-playpause-}
--    , ((0             , playButton), spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Pause")
--    {-stop                                                                                                                                                  -}
--    , ((0             , stopButton), spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Play")
--    {-prev                                                                                                                                                  -}
--    , ((0             , prevButton), spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Prev")
--    , ((shiftMask     , volDown),    spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Prev")
--    , ((modm          , volDown),    spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Prev")
--    {-next                                                                                                                                                  -}
--    , ((0             , nextButton), spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Next")
--    , ((shiftMask     , volUp),      spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Next")
--    , ((modm          , volUp),      spawn "dbus-send --print-reply --type=method_call --dest=org.mpris.guayadeque /Player org.freedesktop.MediaPlayer.Next")

--    -- XF68XK_Audio[Lower/Raise]Volume
    , ((0           , volDown), spawn "amixer -c 0 -q set Master 5%- unmute")
    , ((0           , volUp  ), spawn "amixer -c 0 -q set Master 5%+ unmute")

    -- XF68XK_Calculator
    , ((0             , 0x1008ff1d), spawn "gcalctool")

    ]
    ++

    -- mod-[1..9], Switch to workspace N
    -- mod4-[1..9], Move client to workspace N
    --
    [((0 .|. m, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([0xFE52]++[xK_1 .. xK_9]++[xK_0,xK_minus,xK_dead_grave,xK_BackSpace])
        , (f, m) <- [(W.greedyView, modm), (W.shift, modm .|. shiftMask)]]

    ++

    -- mod-{1,2,3}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{1,2,3}, Move client to screen 1, 2, or 3
    --
    [((m, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_n, xK_r, xK_t] [0..]
        , (f, m) <- [(W.view, modm), (W.shift, shiftMask .|. modm )]]

volDown    ::  KeySym
volDown    = 0x1008FF11
muteButton ::  KeySym
muteButton = 0x1008FF12
volUp      ::  KeySym
volUp      = 0x1008FF13
playButton ::  KeySym
playButton = 0x1008FF14
{-stopButton ::  KeySym-}
{-stopButton = 0x1008FF15-}
{-prevButton ::  KeySym-}
{-prevButton = 0x1008FF16-}
{-nextButton ::  KeySym-}
{-nextButton = 0x1008FF17-}

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings :: XConfig t -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w
                                     >> windows W.shiftMaster)

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w
                                     >> windows W.shiftMaster)

    , ((modm, button4), \w -> focus w >> prevWS)
    , ((modm, button5), \w -> focus w >> nextWS)

    , ((shiftMask.|. modm , button4), \w -> focus w >> shiftToNext)
    , ((shiftMask.|. modm , button5), \w -> focus w >> shiftToPrev)

    --, ((mod4Mask, button4), \w -> focus w >> windows W.focusUp)
    --, ((mod4Mask, button5), \w -> focus w >> windows W.focusDown)
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]


------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.

-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.

myTabConfig ::  Theme
myTabConfig = defaultTheme {fontName = "DejaVu Sans"}

myLayout = onWorkspace "9 chat"     ( avoidStruts ( pidginLayout ||| tiled1))
         . onWorkspace "8 grphx"      gimpLayout
         . onWorkspace "7 vlc"      ( topRightMaster (tabbed shrinkText myTabConfig) )
       {-. onWorkspace "^ vim"      ( avoidStruts (topRightMaster' (3/7) (3/7) (tabbed shrinkText myTabConfig)-}
         . onWorkspace "^ vim"      ( avoidStruts (topRightMaster (tabbed shrinkText myTabConfig)
                                                |||reflectHoriz tiled
                                                |||OneBig (3/4) (3/4)
                                                |||Roledex
                                                |||simpleCross
                                                  ))
         . onWorkspaces ["2 pdf"
                        ,"5 radio"] ( avoidStruts ( tabbed shrinkText myTabConfig
                                                ||| HGrid.GridRatio (16/10) False
                                                  ))
         $ avoidStruts ( reflectHoriz tiled
                     ||| reflectHoriz Grid
                     ||| reflectHoriz (Mirror Accordion)
                     ||| Accordion
                     ||| tabbed shrinkText myTabConfig
                       )
  where
-- default tiling algorithm partitions the screen into two panes
-- The default number of windows in the master pane
-- Default proportion of screen occupied by master pane
-- Percent of screen to increment by when resizing panes
    tiled        = Tall nmaster delta ratio
    nmaster      = 1
    ratio        = 1/2
    delta        = 1/100
    gimpLayout   = withIM 0.11 (Role "gimp-toolbox") $ reflectHoriz
                 $ withIM 0.15 (Role "gimp-dock") Full
    tiled1       = spacing 5 $ Tall nmaster1 delta1 ratio1
    nmaster1     = 1
    ratio1       = 2/3
    delta1       = 3/100
    layout1  = spacing 3 $ reflectHoriz tiled -- spacing 8 $ Grid
    pidginLayout = withIM (18/100) (Role "buddy_list") layout1


------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.

myManageHook :: Query (Endo WindowSet)
myManageHook = composeAll
    [ className =? "Apvlv"                     --> doShift "2 pdf"
    , className =? "Ardour2"                   --> doFloat
    , className =? "Ario"                      --> doShift "5 radio"
    , className =? "Banshee"                   --> doShift "5 radio"
    , className =? "banshee"                   --> doShift "5 radio"
    , className =? "Chromium-browser"          --> doShift "3 web"
    , resource  =? "desktop_window"            --> doIgnore
    , className =? "Emacs"                     --> doShift "0 emacs"
    , className =? "Evince"                    --> doShift "2 pdf"
    , className =? "Exe"                       --> doFloat
    , className =? "Gimp-2.8"                  --> doShift "8 grfx" -- <+> doFloat
    , (role     =? "gimp-toolbox"
      <||> role =? "gimp-image-window")        --> (ask >>= doF . W.sink)
    , className =? "Gimp"                      --> doShift "8 grfx" -- <+> doFloat
    , (role     =? "gimp-toolbox"
      <||> role =? "gimp-image-window")        --> (ask >>= doF . W.sink)
-- Note: hooks earlier in this list override later ones, so put the
-- role hooks earlier than 'className =? "Gimp" ...' if you use both.
    , className =? "Gnome-alsamixer"           --> doFloat
    , className =? "Gpodder"                   --> doFloat
    , className =? "Guake"                     --> doFloat
    , className =? "Guayadeque"                --> doShift "5 radio"
    , className =? "Gvim"                      --> viewShift "^ vim"
    , className =? "Hotot"                     --> doShift "9 chat"
    , className =? "Icedove"                   --> doShift "6 mail"
    , className =? "Inkscape"                  --> doShift "8 grfx"
    , resource  =? "kdesktop"                  --> doIgnore
    , className =? "llpp"                      --> doShift "2 pdf"
    , className =? "libreoffice-writer"        --> doShift "2 pdf"
    , className =? "VCLSalFrame"               --> doShift "2 pdf"
    , className =? "Mupdf"                     --> doShift "2 pdf"
    , className =? "Nautilus"                  --> doShift "4 file"
    , className =? "Neo_layout_viewer"         --> doFloat
    , className =? "Okular"                    --> doShift "2 pdf"
    , className =? "Opera"                     --> doShift "3 web"
    , className =? "OperaNext"                 --> doShift "3 web"
    , className =? "Operapluginwrapper"        --> doFloat
    , className =? "operapluginwrapper-native" --> doFloat
    , className =? "Operapluginwrapper-native" --> doFloat
    , className =? "Pavucontrol"               --> doFloat
    , className =? "Pcmanfm"                   --> doShift "4 file"
    , className =? "Pidgin"                    --> doShift "9 chat"
    , className =? "Plugin-container"          --> doFloat
    , className =? "Qjackctl.real"             --> doFloat
    , className =? "Qt Jambi application"      --> doFloat
    , className =? "Rhythmbox"                 --> doShift "5 radio"
    , className =? "Screenkey"                 --> doFloat >> doIgnore
    , className =? "Skype"                     --> doFloat
    , className =? "Thunar"                    --> doShift "4 file"
    , className =? "Tilda"                     --> doFloat
    , className =? "Tomahawk"                  --> doShift "5 radio"
    , className =? "Transmission-gtk"          --> doFloat
    , className =? "Vlc"                       --> doShift "7 vlc"
    , className =? "Volumeicon"                --> doFloat
    , className =? "W"                         --> doFloat
    , className =? "Xfce4-mixer"               --> doFloat
    , className =? "Xfce4-notifyd"             --> doIgnore
    , className =? "Xpdf"                      --> doShift "2 pdf"
    , className =? "Zathura"                   --> doShift "2 pdf"
    {-, className =? "Workrave"                  --> doShift "^ vim"-}
    , stringProperty "WM_NAME"
                =? "File Operation Progress"   --> doFloat
    , title     =? "Copying Files"             --> doFloat ]
    where   viewShift = doF . liftM2 (.) W.greedyView W.shift
            role      = stringProperty "WM_WINDOW_ROLE"

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook :: Event -> X All
{-myEventHook = promoteWarp-}
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
    -- rmalBorderColor ::  [Char]
--
-- myLogHook = dynamicLogWithPP dzenPP
myLogHook :: Handle -> X ()
myLogHook dest = dynamicLogWithPP defaultPP { ppOutput  = hPutStrLn dest,
                                              ppVisible = wrap "(" ")" }

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.

-- By default, do nothing.
{-myStartupHook :: X ()-}
{-myStartupHook = setWMName "LG3D"-}
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--

main :: IO ()
main = do
        {-xmproc <- spawnPipe "xmobar ~/.xmobarrc"-}
        xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc1"
        _<- spawnPipe "/usr/bin/xmobar ~/.xmobarrc2"
        replace
        xmonad $ withUrgencyHook NoUrgencyHook
               $ gnomeConfig { terminal           = myTerminal
                             , focusFollowsMouse  = myFocusFollowsMouse
                             , borderWidth        = myBorderWidth
                             , modMask            = myModMask
                             , workspaces         = myWorkspaces
                             , normalBorderColor  = myNormalBorderColor
                             , focusedBorderColor = myFocusedBorderColor
--                           , key and mouse bindings
                             , keys               = myKeys
                             , mouseBindings      = myMouseBindings
--                           , hooks, layouts
                             , manageHook         = manageDocks <+> insertPosition Above Newer
                                                                <+> myManageHook
                                                                <+> manageHook gnomeConfig
                             , layoutHook         = myLayout
                             {-, layoutHook         = smartBorders $ layoutHook gnomeConfig-}
                             , logHook            = myLogHook xmproc
                             , handleEventHook    = myEventHook
                             {-, startupHook        = myStartupHook-}
                             }
