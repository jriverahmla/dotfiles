# Full Script

#!/bin/bash

## Check if running as root
```
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root."
  exit 1
fi
```
## Check if apt is available
```
if command -v apt >/dev/null; then
    echo 'apt is available'

fi
```
## User's choice to install or not
```
prompt_for_input() {
    while true; do
        echo -n "Do you want to update the system? (y/n/c): "
        read -r response
        case "$response" in
            [Yy]* )
                echo "You selected Yes."
                return 0
                ;;
            [Nn]* )
                echo "You selected No."
                return 1
                ;;
            [Cc]* )
                echo "You selected Cancel."
                return 2
                ;;
            * )
                echo "Invalid input. Please enter y, n, or c."
                ;;
        esac
    done
}
```
## Checks name of software or software exists
```
dpkg -s $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package $1 is installed!"
else
    echo "Package $1 is NOT installed!"
fi
```
## Shadow downloads software

```echo "Software is installing now```
```sudo apt install -y $software```

## User prompt for install
```
if [[ $? -eq 0 ]]; then
  echo "Installation complete. You can run '$software' to try it."
else
  echo "Installation failed."
fi
```
