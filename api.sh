#!/bin/bash

goto_position() {
    POSITION=$1
    echo "GOING TO POSITION : $POSITION"

    curl -s "$(cmd_url ptzGotoPresetPoint)&name=$POSITION" > /dev/null

    sleep 20
    take_picture $POSITION
}


take_picture(){
    PICTURE_NAME="$CAM-$POSITION-$(date +%m-%d-%y).jpg"
    wget "$(cmd_url snapPicture2)" -O "$PICTURE_NAME"
    echo "$PICTURE_NAME"
}

cmd_url(){
    CMD="$1"
    echo "http://$CAM/cgi-bin/CGIProxy.fcgi?cmd=$CMD&usr=$USER&pwd=$PSSWD"
}
