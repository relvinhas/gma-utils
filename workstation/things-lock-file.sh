#!/bin/bash

# Copied from
# https://culturedcode.com/things/wiki/index.php/Sync_via_Dropbox_with_a_lock_file

# Installation:
# cp things-lock-file.sh /Applications/Things.app/Contents/MacOS/Things

# Set locations
appdir="/Applications/Things.app/Contents/MacOS"
things="Things.exe"
datadir="${HOME}/Dropbox/Library/Application Support/Cultured Code/Things"
lockfile="Things.lock"

# Check for lock file
if [ -f "${datadir}/${lockfile}" ]
then
	/usr/bin/osascript -e "set CR to ASCII character 13" \
	-e "tell application \"System Events\" to display alert \"${lockfile} exists!\" \
	message \"The lock file ${datadir}/${lockfile} exists indicating another system is running Things.\" \
	& CR & CR & \"Stopping to prevent possibly corrupting the data from multiple updates.  \
	If you are certain no other systems are running Things you can delete the lock file and try again.\" \
	buttons {\"OK\"} default button 1"
	exit 1
fi

# No lock file, create one
if /usr/bin/touch "${datadir}/${lockfile}"
then
	date >> "${datadir}/${lockfile}"
	hostname >> "${datadir}/${lockfile}"
else
	/usr/bin/osascript -e "set CR to ASCII character 13" \
	-e "tell application \"System Events\" to display alert \"Can not create lock file\" \
	message \"Can not create the lock file ${datadir}/${lockfile},\" & CR & CR & \
	\"Stopping to prevent possibly corrupting the data from multiple updates.  \
	Once you can create the lock file you can try again.\" \
	buttons {\"OK\"} default button 1"
	exit 1
fi

# Now, execute Things.  Purposely not backgrounding.
"${appdir}/${things}"

# Clean up lock file
if /bin/rm "${datadir}/${lockfile}"
then
	# All good, exit clean
	exit 0
else
	# Problem.  Warn.
	/usr/bin/osascript -e "set CR to ASCII character 13" \
	-e "tell application \"System Events\" to display alert \"Warning\" \
	message \"Could not delete the lock file ${datadir}/${lockfile},\" & CR & CR & \
	\"Delete the lock file manually before executing Things again.\" \
	buttons {\"OK\"} default button 1"
	exit 2
fi
