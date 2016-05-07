#!/bin/bash

goto_position() {
    # Function to go to prest position
    POSITION=$1
    echo "GOING TO POSITION : $POSITION"

    curl -s "$(cmd_url ptzGotoPresetPoint)&name=$POSITION" > /dev/null

    sleep 20
    take_picture $POSITION
}

take_picture(){
    # Function to take a picture and save it locally
    PICTURE_NAME="$CAM-$POSITION-$(date +%m-%d-%y).jpg"
    wget "$(cmd_url snapPicture2)" -O "$PICTURE_NAME"
    echo "$PICTURE_NAME"
}

cmd_url(){
    # Helper function to build the URI
    CMD="$1"
    echo "http://$CAM/cgi-bin/CGIProxy.fcgi?cmd=$CMD&usr=$USER&pwd=$PSSWD"
}
