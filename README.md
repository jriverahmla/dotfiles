# Dotfiles Task 4 Summary
## Dotfiles collection contents:
- This collection has configurations and scripts for setting up Vim, managing .bashrc aliases, and installing Ansible. Each script makes sure the system is running as root, verifies the availability of apt, prompts the user for system updates, sees if specific software is installed, and installs it if needed.

## How to Clone/Utilize the Dotfiles in This Repo
- Clone the Repository:
```
git clone https://github.com/jriverahmla/dotfiles.git ~/homefiles
 cd ~/homefiles
```

## Use the Vim Configuration:

- Add the script to your vimrc file to install Vundle, plugins, the jellybeans color scheme, and autocompletion:
```
 set nocompatible              " be iMproved, required
 filetype off                  " required

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'nanotech/jellybeans.vim'  " Color scheme
 Plugin 'nathanaelkane/vim-indent-guides'  " Indent guides
 Plugin 'tpope/vim-fugitive'  " Git integration
 Plugin 'Valloric/YouCompleteMe'  " Autocompletion

 call vundle#end()            " required
 filetype plugin indent on    " required

 colorscheme jellybeans
 ```

- Use the .bashrc File:


## Copy the .bashrc file to your home directory:

```
 cp ~/.bashrc ~/homefiles/.bashrc
 ```

## Reload the Environment:
```
 source ~/.bashrc
 ```


## Run the Installation Script:
```
 chmod +x install_script.sh
 sudo ./install_script.sh
 ```

- Save the script as install_script.sh and make it executable:

## README's for Additional Details
- Refer to the README files in the repository for more information on specific tasks, such as setting up Vim configurations, using .bashrc aliases, and running installation scripts.

Retrospective notes for improvements:
## Clearer documentation 
- Make the README to have more detailed instructions and explanations.
## More functionality 
- Have to add support for more software installs and system checks.
## Error Handling 
- Needs better error handling to stop potential issues during script execution. Shell checks used to check scripts.
