# Foscam-Bash
Bash implementation of the Foscam IP Cameras API

# Usage
This library provides utilities to control your Foscam IP camera.

For example, to take and download an picture :
```
take_picture my.camera.org:88
```

## Configuration
In your script, you should define some environment variables

If not provided, they will default to :

```
# Path to save the pictures
PICTURE_PATH=./
# Path to the log-file
LOG_FILE=foscam_api.log
# Time to sleep while the camera is moving
TRAVEL_DURATION=10
```
