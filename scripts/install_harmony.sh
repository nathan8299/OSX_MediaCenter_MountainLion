#!/usr/bin/env bash

echo "#------------------------------------------------------------------------------"
echo "# Installing Logitech Harmony"
echo "#------------------------------------------------------------------------------"
## http://miniharmony.blogspot.nl/2010/06/episode-2-preparing-harmony-one-to-be.html
## http://www.fieg.nl/plex-mac-mini-harmony-remote-and-how-they-roll-together

source ../config.sh

brew install hg

#echo "Download latest Auto-Sub from http://code.google.com/p/auto-sub/"
#open http://code.google.com/p/auto-sub/downloads/list
#
#while ( [ ! -e ~/Downloads/auto-sub ] )
#do
#    printf 'Waiting for Auto-Sub to be downloaded…\n' "YELLOW" $col '[WAIT]' "$RESET"
#    sleep 15
#done
#sleep 3
#sudo mv ~/Downloads/auto-sub /Applications/

echo "-----------------------------------------------------------"
echo "| Login to Logitech My Harmony (http://myharmony.com)"
echo "-----------------------------------------------------------"
open http://myharmony.com


#if [ -f $DIR/Blabla ] ; then
    echo "File BlaBla not found"

    while ( [ ! -e ~/Downloads/LogitechHarmonySoftware.dmg ] )
    do
        printf 'Waiting for Logitech Harmony Software to be downloaded…\n' "YELLOW" $col '[WAIT]' "$RESET"
        sleep 15
    done
    printf 'Logitech Harmony installer found. Installing…\n' "YELLOW" $col '[WAIT]' "$RESET"

    hdiutil attach LogitechHarmonySoftware.dmg
    cd /Volumes/LogitechHarmonySoftware.pkg/
    #installer -pkg LogitechHarmonySoftware.pkg -target "/"
    open LogitechHarmonySoftware.pkg
    hdiutil detach /Volumes/LogitechHarmonySoftware.pkg/

#else
#    echo "Blabla found"
#fi

echo "#------------------------------------------------------------------------------"
echo "# Install Logitech Harmony - Complete"
echo "#------------------------------------------------------------------------------"