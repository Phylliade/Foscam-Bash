#!/bin/bash

goto_position() {
    # Function to go to prest position
    # Arg1 : URL of the camera
    # Argé : Name of the position to go to
    CAM="$1"
    POSITION="$2"
    echo "GOING TO POSITION : $POSITION"  >> $LOG_FILE

    curl -s "$(cmd_url $CAM ptzGotoPresetPoint)&name=$POSITION" > /dev/null

    sleep $TRAVEL_DURATION
}

take_picture(){
    # Function to take a picture and save it locally
    # Arg1 : URL of the camera
    CAM="$1"
    PICTURE_NAME="$PICTURE_PATH/$CAM-$POSITION.jpg"
    wget "$(cmd_url $CAM snapPicture2)" -O "$PICTURE_NAME" -o /dev/null  >> $LOG_FILE
}

cmd_url(){
    # Helper function to build the URI
    # Arg1 : URL of the camera
    CAM="$1"
    CMD="$2"
    echo "http://$CAM/cgi-bin/CGIProxy.fcgi?cmd=$CMD&usr=$USER&pwd=$PSSWD"
}
