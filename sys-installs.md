# Task 3 - Managing Installs

## Installing a package

When installing ansible, there are a few commands to run.
- `sudo apt update` to update packages
- `sudo apt install software-properties-common` provides an abstraction of the used apt repositories. It allows for easy managegement of the distribution and independent software vendor software sources. (AskUbuntu)
- `sudo add-apt-repository --yes --update ppa:ansible/ansible` is the command that includes the official project’s PPA (personal package archive) in the system’s list of sources: (DigitalOcean)
- `sudo apt install ansible` installs Ansible

## Scripts

- This is after entering the vim text editor:

- For checking if the EUID is running as root: <br>
if [ "$EUID" -ne 0 ] <br>
  then echo "Please run as root"<br>
  exit <br>
fi <br>

- For checking if the package manager is apt: <br>
if command -v apt >/dev/null; then <br>
    echo 'apt is available' <br>
fi <br>

- For having the user type `y` or `n` for installs: <br>
prompt_for_input() { <br>
    while true; do <br>
        echo -n "Do you want to update the system? (y/n/c): " <br>
        read -r response <br>
        case "$response" in <br>
            [Yy]* ) <br>
                echo "You selected Yes." <br>
                return 0 <br>
                ;; <br>
            [Nn]* ) <br>
                echo "You selected No." <br>
                return 1 <br>
                ;; <br>
            [Cc]* ) <br>
                echo "You selected Cancel." <br>
                return 2 <br>
                ;; <br>
            * ) <br>
                echo "Invalid input. Please enter y, n, or c." <br>
                ;; <br>
        esac <br>
    done <br>
} <br>

- Checks to see if software exists:
dpkg -s $1 &> /dev/null <br>

if [ $? -eq 0 ]; then <br>
    echo "Package $1 is installed!" <br>
else <br>
    echo "Package $1 is NOT installed!" <br>
fi <br>

- Shadow download software <br>
Uses the command `echo "Software is installing now` <br>
`sudo apt install -y $software` to install <br>

## User prompt for install
if [[ $? -eq 0 ]]; then <br>
  echo "Installation complete. You can run '$software' to try it." <br>
else <br>
  echo "Installation failed." <br>
fi <br>

- Saves the script and makes it executable:
- `chmod +x install_script.sh`
- `sudo ./install_script.sh` runs the script
## Cited resources

https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
https://linuxhandbook.com/install-ansible-linux/
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-22-04
https://askubuntu.com/questions/1000118/what-is-software-properties-common
https://stackoverflow.com/questions/18215973/how-to-check-if-running-as-root-in-a-bash-script
https://unix.stackexchange.com/questions/519773/find-package-os-distribution-manager-for-automation
https://ostechnix.com/create-interactive-bash-scripts-with-yes-no-cancel-prompt/
https://linuxconfig.org/how-to-test-for-installed-package-using-shell-script-on-ubuntu-and-debian
