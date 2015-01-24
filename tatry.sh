#!/bin/sh

RND_NAME=$(cat /dev/urandom | tr -dc 'A-Z0-9' | fold -w 16 | head -n 1)
DIR="/home/paweusz/Pictures"
PREFIX="tatry-"
FILE="$DIR/$PREFIX$RND_NAME.jpg"

rm -v "$DIR/$PREFIX"*.jpg

#curl -H "Referer: http://www.zol.pl/webcam/" -o "$FILE" http://www.zakopaneonline.eu/webcam/duze/zakopane.jpg
curl -H "Referer: http://www.zol.pl/webcam/" -o "$FILE" http://www.zakopaneonline.eu/webcam3/duze/kasprowy.jpg
#wget -o /dev/null -q -O "$FILE" http://www.czteryporyroku.pl/kamery/apartamenty_zakopane.jpg 2>/dev/null

sleep 5

# load new desktop background image
echo "Setting wallpaper to $FILE"
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)
gsettings set org.gnome.desktop.background picture-uri "file://$FILE"

