#!/bin/bash

## Check if running as root
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root."
  exit 1
fi

## Check if apt is available
if command -v apt >/dev/null; then
    echo 'apt is available'
    prompt_for_input
    case $? in
        0)
            echo "Updating the system..."
            sudo apt update && sudo apt upgrade -y
            ;;
        1)
            echo "Skipping system update."
            ;;
        2)
            echo "Update canceled."
            exit 0
            ;;
    esac
else
    echo 'apt is not available'
    exit 1
fi

## Define the software to be installed
software="ansible"

## Check if the software is installed
if dpkg -s "$software" &> /dev/null; then
    echo "Package $software is installed!"
else
    echo "Package $software is NOT installed!"
fi

## Install the software
echo "Software is installing now"
if sudo apt install -y "$software"; then
  echo "Installation complete. You can run '$software' to try it."
else
  echo "Installation failed."
fi
