# MiMa script

These scripts are used on certain stations at the MiMa museum in Oberwolfach.

# Installation
The scripts are installed (`rsync`ed) into `~/bin` via
```
install.sh
```
It is recommended to have `~/bin` in the `PATH`, which is the default on most Linux distributions.

# Starting exhibits
Exhibit start script names are prefixed with `exhibt-` followed by an identifier of that exhibit.

# Restart exhibits after a crash
The script `repeat-exhibit` will restart the executable supplied as argument indefinitely, e.g.
```
repeat-exhibit exhibit-kiosk
```
will restart `exhibit-kiosk` if it exits for whatever reason.

# Stopping exhibits
All Exhibits can be stopped via
```
stop-exhibits
```
This includes the `repeat-exhibit` script and any process whose name starts with `exhibit-`.

# Hide the cursor
The script `hidecursor` hides the cursor and starts another child process supplied as an argument.
When the child exits, the cursor will not be hidden anymore.

# Fake display resolution for testing
Sometimes the display used for development does not match the resolution used in production.
Assume your test display has a default resolution of `1920x1080` (FullHD), but in production, `3840x2160` (UHD) is used.
The command
```
fakeResolution 3840x2160
```
will allocatec a `3840x2160` frame buffer and will scale it down to `1920x1080`.

If aspect ratios do not match, the image will be stretched.
 
# Autostart
This assumes that `openbox` is used as a window manager.

Each line added to `~/.config/openbox/autostart` will be run in a shell.
If there is no `&` at the end of a line, execution will block until the corresponding process exits.

# Dependencies
The scripts have been tested on Ubunt 18.04. Some additional tools are needed:
* `xrandr`, `pkill`
* `xbanish` based on https://github.com/IMAGINARY/xbanish-hide/
