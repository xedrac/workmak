Go to the directory where you have downloaded colemash:
sudo cp xorg/colemash /etc/X11/xkb/symbols/colemash
(for ubuntu 10.04) Type: sudo cp colemash /usr/share/X11/xkb/symbols/colemash

Type: setxkbmap -v colemash && xset r 66 

You should get something similar to this:
Warning! Multiple definitions of keyboard layout
         Using command line, ignoring X server
Trying to build keymap using the following components:
keycodes:   xfree86+aliases(qwerty)
types:      complete
compat:     complete
symbols:    pc(pc105)+workman+level3(ralt_switch)
geometry:   pc(pc105)
To switch back to QWERTY type: 
setxkbmap us; xset -r 66
