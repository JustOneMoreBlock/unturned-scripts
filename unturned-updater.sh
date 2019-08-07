#!/bin/bash

# yum -y install mono unzip wget screen
# apt-get -y install mono unzip wget screen

# Paths
gamepath="/home/Games"
game="$gamepath/unturned"
app_id="1110390"
steamcmd="$gamepath/steamcmd"

# Countdown Timer
# Loops every 6 hours
countdown_timer="6"

update_unturned() {
sh ${steamcmd}/steamcmd.sh +login anonymous +force_install_dir ${game} +app_update ${app_id} validate +exit
}

update_rocket() {
mkdir -p /home/Temp/
cd /home/Temp
wget https://ci.rocketmod.net/job/Rocket.Unturned/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip -O Rocket.zip
unzip -qqo Rocket.zip
yes | cp -rf Modules ${game}/
yes | cp -rf Scripts/Linux/RocketLauncher.exe ${game}/
}

start_servers() {
game_servers="${game}/Servers"
cd ${game_servers}
for server in *
        do
                cd ${game}
                ulimit -n 65536
                screen -dmS ${server} mono RocketLauncher.exe ${server}
                echo "Starting ${server}"
                sleep 15  
        done
}

function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

while true; do
update_unturned
update_rocket
start_servers
countdown $((${countdown_timer}*60*60))
done