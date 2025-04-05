# Full Script

#!/bin/bash

## Check if running as root
if [[ $EUID -ne 0 ]]; then<br>
  echo "Please run as root."<br>
  exit 1<br>
fi<br>

## Check if apt is available
if command -v apt >/dev/null; then<br>
    echo 'apt is available'<br>
fi<br>

## User's choice to install or not
prompt_for_input() {<br>
    while true; do<br>
        echo -n "Do you want to update the system? (y/n/c): "<br>
        read -r response<br>
        case "$response" in<br>
            [Yy]* )<br>
                echo "You selected Yes."<br>
                return 0<br>
                ;;<br>
            [Nn]* )<br>
                echo "You selected No."<br>
                return 1<br>
                ;;<br>
            [Cc]* )<br>
                echo "You selected Cancel."<br>
                return 2<br>
                ;;<br>
            * )<br>
                echo "Invalid input. Please enter y, n, or c."<br>
                ;;<br>
        esac<br>
    done<br>
}<br>

## Checks name of software or software exists
dpkg -s $1 &> /dev/null<br>

if [ $? -eq 0 ]; then<br>
    echo "Package $1 is installed!"<br>
else<br>
    echo "Package $1 is NOT installed!"<br>
fi<br>

## Shadow downloads software
echo "Software is installing now<br>
sudo apt install -y $software<br>

## User prompt for install
if [[ $? -eq 0 ]]; then<br>
  echo "Installation complete. You can run '$software' to try it."<br>
else<br>
  echo "Installation failed."<br>
fi<br>
