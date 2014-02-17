# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Start lxsession
lxsession &
xfce4-power-manager &

## Start thunar daemon
thunar --daemon &

## Last background backup
nitrogen --restore &

## Launch panel
tint2 -c ~/.config/tint2/my_tint2rc &

## Composite
(sleep 10s && cb-compmgr --cairo-compmgr) &

## Enable desktop terminal
## tilda &
(sleep 1s && tilda) &
#(sleep 3s && /dev/pts/0 < tilda) &
#(sleep 6s && /dev/pts/1 < ncmpcpp) &

## Conky
#(sleep 2s && conky -q -c ~/.config/conky/conkyrc_time) &
#(sleep 10s && conky -q -c ~/.config/conky/conkyrc_power) &
#(sleep 10s && conky -q -c ~/.config/conky/conkyrc_sys) &
(sleep 6s && /home/xav/scripts/conky_launcher.sh > /dev/pts/0) &

## Applets
(sleep 1s && nm-applet) &
(sleep 2s && volumeicon) &

## pad management
if egrep -iq 'touchpad' /proc/bus/input/devices; then
	synclient VertEdgeScroll=1 &
	synclient TapButton1=1
fi

## Tild manager
(sleep 3s && pytyle) &

## Boutton keyboard
#bbdock /home/xavier/.icons/icon_48x48_matchbox-keyboard.png:matchbox-keyboard::1 &

# Economiseur d'écran
#gnome-screensaver &
xscreensaver -no-splash &

## Clipboard manager (?)
(sleep 3s && parcellite) &

# Les enmmerdes commencent la

# Set a background color
##BG=""
##if which hsetroot >/dev/null; then
##    BG=hsetroot
##else
##    if which esetroot >/dev/null; then
##	BG=esetroot
##    else
##	if which xsetroot >/dev/null; then
##	    BG=xsetroot
##	fi
##    fi
##fi
##test -z $BG || $BG -solid "#303030"

# D-bus
##if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
##       eval `dbus-launch --sh-syntax --exit-with-session`
##fi

# Make GTK apps look and behave how they were set up in the gnome config tools
#if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
#  /usr/libexec/gnome-settings-daemon &
#elif which gnome-settings-daemon >/dev/null; then
#  gnome-settings-daemon &
# Make GTK apps look and behave how they were set up in the XFCE config tools
##elif which xfce-mcs-manager >/dev/null; then
##  xfce-mcs-manager n &
#fi

# Preload stuff for KDE apps
#if which start_kdeinit >/dev/null; then
#  LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
#fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
#DESKTOP_ENV="OPENBOX"
#if which /usr/lib/openbox/xdg-autostart >/dev/null; then
#  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
#fi

(sleep 120s && cb-fortune) &
