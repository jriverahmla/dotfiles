# Vim Config

## Cloning the Repo and Running the Script
- Clone the repository:
    ```bash
    git clone https://github.com/jriverahmla/vim-config.git
    ```
- Installing Vundle adding plugins and a color scheme
   using this script within the vimrc file, this will install Vundle, adds the plugins, adds the jellybeans color scheme and adds a plugin for autocompletion

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

3. Run the setup script:
    ```bash
    ./setup_vim.sh
    ```

## Citations Used
- Linux Handbook - Basic Vim Commands
- University of Washington - Vim Cheat Sheet
- Carnegie Mellon University - Vim Cheat Sheet
- FreeCodeCamp - Vimrc Configuration Guide
- VundleVim - Vundle.vim
- Stack Overflow - Where is my .vimrc file?
- Amix's Vimrc on GitHub
- Formatting the README.md file within the vim-config was from Microsoft CoPilot
