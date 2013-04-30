#!/bin/bash
##############
# 
# This script will remove the Unidentified Developer warning from an app. 
# This is to be used by accounts that only have user level rights. 
# This is meant to be in self service for a user. 
#
# This was writen by
# Kyle Brockman
# While working for Univeristy Information Technology Servives
# at the Univeristy of Wisconsin Milwaukee
##############
CD="/Applications/Utilities/CocoaDialog.app/Contents/MacOS/CocoaDialog"
CDI="/Applications/Utilities/CocoaDialog.app/Contents/Resources"

echo "Tell user want to selet"
echo "user selects the app"
selectedapp=`$CD fileselect --title "Remove Unidentified Developer Dialog" --text "Choose Application you want to remove Unidentified Developer message" --with-extensions .app`

echo $selectedapp
if [ "$selectedapp" == "" ]; then
	echo "User clicked cancel"
	exit 0
else
	/usr/bin/xattr -d com.apple.quarantine $selectedapp
	echo "open app for user"
	/usr/bin/open $selectedapp
	echo "tell user app is ready to go"
	$CD bubble --timeout 30 --title "Unidentified Warning Removed" --text "You would no long receive the warning prompt for this app."
	
fi

exit 0