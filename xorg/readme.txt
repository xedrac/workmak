Automated Installation Instructions:
-------------------------------------------------------

You can use the supplied installer script to add the layout automatically.
The advantage of the script is that the layout will be selectable from the GUI's list
of keyboard layouts, and not just via setxkbmap. (Although a reboot may be needed to take effect).



Manual Installation Instructions:
--------------------------------------------------------

Depending on your linux distribution, you will likely install it with one of these two commands:
    sudo cp workmak /etc/X11/xkb/symbols/workmak
                     --or--
    sudo cp workmak /usr/share/X11/xkb/symbols/workmak

Then to use to, type:
    setxkbmap -v workmak && xset r 66 

You should get something similar to this:
Warning! Multiple definitions of keyboard layout
         Using command line, ignoring X server
Trying to build keymap using the following components:
keycodes:   xfree86+aliases(qwerty)
types:      complete
compat:     complete
symbols:    pc(pc105)+workmak+level3(ralt_switch)
geometry:   pc(pc105)

To switch back to QWERTY type: 
setxkbmap us; xset -r 66
