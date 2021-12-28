xset r rate 300 45
xcompmgr &
xrandr --output HDMI-3 --left-of HDMI-1
xwallpaper --zoom $HOME/dox/media/pix/wallpapers/wallpaper.jpg # change this to wherever your wallpaper might be
sxhkd &
fcitx &
$HOME/dox/sh/dwm-bar/dwm-bar.sh &
$HOME/dox/sh/keyboard-remapping/commands &
