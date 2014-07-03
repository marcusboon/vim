# MY AWESOME VIM

Config files and extensions for vim to make it more awesome!

## Whats in it?

* [pathogen](https://github.com/tpope/vim-pathogen), makes it easy to manage plugins and runtime files
* [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* [Command-T](https://github.com/wincent/Command-T), a project file filter for easily opening specific files
* [Fugitive](https://github.com/tpope/vim-fugitive), Awesome git integration for VIM
* [Tagbar](https://github.com/majutsushi/tagbar), plugin for browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope.

### vim key bindings

* `,n` brings up [NERDTree](https://github.com/scrooloose/nerdtree)
* `,t` brings up [Command-T](https://github.com/wincent/Command-T)
* `,b` restricts Command-T to open buffers
* `,l` brings up [Tagbar](https://github.com/majutsushi/tagbar)
    - Then 'p' jumps to the definition
* `,[space]` strips trailing whitespace
* `Ctrl]` jump to definition using ctags

## Installation

I use pathogen to manage the other plugins and use git to handle updating them

If you have a current vim setup I suggest backing it up

    mv .vimrc .vimrc.bak
    mv .vim .vim.bak

Then clone the repo

    git clone https://github.com/marcusboon/vim.git .vim

Then initialise and update the submodules

    cd .vim
    git submodule init
    git submodule update

Then you might have to follow install instructions, especially for [Command-T](https://github.com/wincent/Command-T)

Finally, you can use my vimrc

    ln -s .vim/vimrc .vimrc
