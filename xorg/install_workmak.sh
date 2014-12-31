#!/bin/bash
#
# This script will install the Workmak keyboard layout into the XOrg
# base xkb list, causing it to show up in the layout lists in all of 
# the major desktop environments, such as Gnome/KDE.  Running it multiple
# times is harmless.
#
# Tested Linux Distributions:
#    Arch Linux
#
#
# TODO:  Auto detect where XKB_PATH is, rather than assume its location
#
#
# Author: Shawn Badger
# Date:   12/30/2014
#

WORKMAK_XKB_FILE=workmak

XKB_PATH=/usr/share/X11/xkb
RULES_PATH=$XKB_PATH/rules
SYMBOLS_PATH=$XKB_PATH/symbols
XKB_CACHE_PATH=/var/lib/xkb

XORG_LST_FILE=$RULES_PATH/xorg.lst
XORG_XML_FILE=$RULES_PATH/xorg.xml

TMP_FILE=./workmak_install.tmp

if [[ $(id -u) -ne 0 ]]; then
  echo "This script requires root privileges";
  exit 1;
fi

if [ ! -e "$XORG_XML_FILE" ]; then
  echo "It appears as though XKB files are not in $XKB_PATH" 
  echo "If your distribution stores them elsewhere, you can modify this script"
  echo "by changing the XKB_PATH field to point to the correct directory."
  echo "Some distributions use /etc/X11/xkb"
  exit 1;
fi

#echo " * Copying $XORG_LST_FILE file to $TMP_FILE"
cp $XORG_LST_FILE $TMP_FILE
if [ $? -ne 0 ]; then
  echo "   *** Failed to copy $XORG_LST_FILE to $TMP_FILE"
  exit 1
fi

echo " * Removing existing Workmak entries in $XORG_LST_FILE"
awk '!/Workmak/' $TMP_FILE > $XORG_LST_FILE
if [ $? -ne 0 ]; then
  echo "   *** Failed to remove Workmak entries from $XORG_LST_FILE file"
  exit 1
fi

#echo " * Copying $XORG_LST_FILE file to $TMP_FILE"
cp $XORG_LST_FILE $TMP_FILE
if [ $? -ne 0 ]; then
  echo "   *** Failed to copy $XORG_LST_FILE to $TMP_FILE"
  exit 1
fi

echo " * Adding Workmak entry to $XORG_LST_FILE"
awk '/Workman/ && !x {print "  workmak         us: English (Workmak)"; x=1} 1' $TMP_FILE > $XORG_LST_FILE 
if [ $? -ne 0 ]; then
  echo "   *** Failed to add Workmak entry to $XORG_LST_FILE file"
  exit 1
fi

#echo " * Copying $XORG_XML_FILE file to $TMP_FILE"
cp $XORG_XML_FILE $TMP_FILE
if [ $? -ne 0 ]; then
  echo "   *** Failed to copy $XORG_XML_FILE to $TMP_FILE"
  exit 1
fi

echo " * Adding Workmak section to $XORG_XML_FILE file, if not already present"
xsltproc workmak.xsl $TMP_FILE 1> $XORG_XML_FILE 2> /dev/null
if [ $? -ne 0 ]; then
  echo "   *** Failed to add Workmak section to $XORG_XML_FILE file"
  exit 1
fi

echo " * Copying Workmak symbols file to $SYMBOLS_PATH"
cp $WORKMAK_XKB_FILE $SYMBOLS_PATH/
if [ $? -ne 0 ]; then
  echo "   *** Failed to add Workmak symbols file"
  exit 1
fi

echo " * Removing xkb cache files"
rm -f $XKB_CACHE_PATH/*.xkm

rm -f $TMP_FILE


echo " --- Workmak layout should now be installed and ready to use --- "

