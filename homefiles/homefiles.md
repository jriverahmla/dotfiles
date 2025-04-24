## Setting Up the .bashrc File

- To create the bashrc file in my home directory, I used the command `nano ~/.bashrc` This will host the aliases.

## Editing the `.bashrc` file

   Opening the `.bashrc` file:
   ```
   alias update='sudo apt-get update && sudo apt-get upgrade'
   alias cls='clear'
  nano ~/.bashrc
   ```
  - ![New bash file](new_bash.png)

Add "awesome" bash aliases:
  ```
  alias pg="ping google.com -c 5"
  alias pt="ping facebook.com -c 5"
  ```
- ![Awesome aliases](awesome_aliases.png) 

Something cool from The Ultimate B.A. .bashrc file:
This alias shows the date

```alias da='date "+%Y-%m-%d %A %T %Z"' ```       

![BA bash](ba_bash.png) 

- Full Script:
```
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi  

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias update='sudo apt-get update && sudo apt-get upgrade'
alias cls='clear'
alias pg="ping google.com -c 5"
alias pt="ping facebook.com -c 5"
alias da='date "+%Y-%m-%d %A %T %Z"'
```

Verifying the added aliases / bash additions work and reloading the .bashrc file:
- `source ~/.bashrc`

- ![Bash check](bash_check.png) 

Testing the aliases: 
```
update
cls
pg
pt
```

- ![Alias test](alias_test.png) 

Install Curl if required:
- To check:
  ```curl```
- To install:
  ```sudo apt-get install curl```

The Git repository is cloned using ```git clone https://github.com/jriverahmla/dotfiles.git ~/homefiles```
This command was used to copy the .bashrc file to my dotfiles repository
```cp ~/.bashrc ~/homefiles/.bashrc  ```        

Write a script
Create a script file:
```nano ~/homefiles/setup_bashrc.sh```

## Script to Remind User to Reload Environment 

## Create the Script

 Creating a script file:
   ```
   nano ~/homefiles/remind_reload.sh
```
Adding the script:
```
#!/bin/bash

# Remind user to reload environment 
echo "Please reload your environment with 'source ~/.bashrc' or by logging out and back in."
```
- ![Reload environment](reload_environment.png) 

Make the script executable:
```chmod +x ~/homefiles/setup_bashrc.sh``` 

Add / copy the script to the dotfiles repository
Copy the script:
```cp ~/homefiles/setup_bashrc.sh ~/homefiles/setup_bashrc.sh``` 

Test the new .bashrc file
Rename the current .bashrc file:
 
```mv ~/.bashrc ~/.bashrc_backup```

Copy the recovery .bashrc file to the home directory:
```cp /homefiles/.bashrc ~/.bashrc_backup```

Rename the new .bashrc file for testing:
```cp ~/homefiles/.bashrc ~/homefiles/new_bashrc```

Load the new .bashrc file:
```source ~/homefiles/.bashrc```
- ![Load bash](load_bash.png)

Check for errors and verify functionality
Reload the .bashrc file:

```source ~/.bashrc_backup```
use pg and pt
- ![Error check](error_check.png)
If everything works, replace the recovery .bashrc with the new one:

```mv ~/homefiles/new_bashrc ~/.bashrc```
Reload the final .bashrc file:

```source ~/.bashrc```


## Citations

https://github.com/vikaskyadav/awesome-bash-alias
https://gist.github.com/zachbrowne/8bc414c9f30192067831fafebd14255c
https://www.linuxquestions.org/questions/linux-software-2/linux-command-shell-bash-for-pg-658342/
https://stackoverflow.com/questions/5055059/reload-environment-variables-in-a-bash-script
https://askubuntu.com/questions/229589/how-to-make-a-file-e-g-a-sh-script-executable-so-it-can-be-run-from-a-termi
https://stackoverflow.com/questions/42131982/how-can-i-make-my-shell-script-executable
https://askubuntu.com/questions/198730/how-to-restore-bashrc-file

## Microsoft CoPilot
## Prompts:
- "What script would remind a user to reload the environment?"
- "How do you verify functionality for these two aliases?      alias pg="ping google.com -c 5" and alias pt="ping facebook.com -c 5"     "
- "What commands would I invoke to test all aliases thus far?"
