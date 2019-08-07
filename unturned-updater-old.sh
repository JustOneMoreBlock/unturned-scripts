#/bin/bash

# File Check
CURRENT="/home/Games/unturned/Modules/Unturned/Unturned.dll"
UPDATED="/home/testing/unturned/Modules/Unturned/Unturned.dll"

# SteamCMD Login
user=""
pass=""

# Download Unturned
./steamcmd.sh @sSteamCmdForcePlatformBitness 32 +login ${user} ${pass} +force_install_dir unturned +app_update 304930 validate +exit

# Check if the current file matches the updated file.
if diff ${CURRENT} ${UPDATED} > /dev/null
then
    echo "Updated"
else
command() {

path="/home/Games/unturned/Servers"

cd ${path}

for server in *
        do
                screen -S ${server} -p 0 -X stuff "$1^M"  
        done
}

command "broadcast Restarting in 2 Minutes for Unturned update. Please get to a safe place."
sleep 60
command "save"
command "broadcast Restarting in 1 Minute for Unturned update. Please get to a safe place."
sleep 60
command "save"
command "broadcast Update your Unturned and Re-join."
sleep 5
command "shutdown"

sleep 15
killall -9 screen
screen -wipe
/sbin/start

fi