<<<<<<< HEAD
Go to the directory where you have downloaded dash and install it to the proper location.  Some examples of common locations are:

sudo cp xorg/dash /etc/X11/xkb/symbols/dash
sudo cp xorg/dash /usr/share/X11/xkb/symbols/dash

Type: setxkbmap -v dash && xset r 66 
=======
Depending on your linux distribution, you will likely install it with one of these two commands:
    sudo cp wormak /etc/X11/xkb/symbols/wormak
                     --or--
    sudo cp wormak /usr/share/X11/xkb/symbols/wormak

Then to use to, type:
    setxkbmap -v wormak && xset r 66 
>>>>>>> oldstate

You should get something similar to this:
Warning! Multiple definitions of keyboard layout
         Using command line, ignoring X server
Trying to build keymap using the following components:
keycodes:   xfree86+aliases(qwerty)
types:      complete
compat:     complete
<<<<<<< HEAD
symbols:    pc(pc105)+dash+level3(ralt_switch)
=======
symbols:    pc(pc105)+wormak+level3(ralt_switch)
>>>>>>> oldstate
geometry:   pc(pc105)

To switch back to QWERTY type: 
setxkbmap us; xset -r 66
