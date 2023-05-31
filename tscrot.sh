#! /bin/bash

if [ -t 0 ]; then
        echo 'TIMESTAMP YOUR OUTPUT AND TAKE A SCREENSHOT ON COMPLETION.'
        echo 'If you pass an argument for this tool, it will be used as the screenshot name. By default, screenshot is saved to the current directory.'
        echo "Usage: nmap 127.0.0.1 | $0 <screenshot_name>"
        exit 1
fi

scrot_name=$1

# if scrot_name doesn't end with .png, add it.
if [[ $scrot_name != *.png ]]; then
        scrot_name="$scrot_name.png"
fi

# 'ts' will timestamp the output. Without the sleep, scrot will run immediately, so this makes sure the previous output finishes first, then takes a screenshot. 
# If there is a $1, uses it as the screenshot name. Otherwise uses scrot's default timestamp format.
ts
sleep 1
if [ -z "$1" ]; then
        scrot
else
        scrot "$scrot_name"
fi
