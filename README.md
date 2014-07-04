# MY AWESOME VIM

Config files and extensions for vim to make it more awesome!

## Whats in it?

* [pathogen](https://github.com/tpope/vim-pathogen), makes it easy to manage plugins and runtime files
* [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* [Ctrl-P](https://github.com/kien/ctrlp.vim), a project file filter for easily opening specific files
* [Fugitive](https://github.com/tpope/vim-fugitive), Awesome git integration for VIM
* [Tagbar](https://github.com/majutsushi/tagbar), plugin for browsing the tags of source code files. It provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope.
* [DelimitMate](https://github.com/Raimondi/delimiteMate), plugin that provides automatic closing of quotes, parenthesis, brackets, etc
* [SuperTab](https://github.com/ervandew/supertab.git), tab completion, nuff said

### vim key bindings

* `,n` brings up [NERDTree](https://github.com/scrooloose/nerdtree)
* `,p` brings up [CtrlP](https://github.com/kien/ctrlp.vim)
* `,b` restricts Ctrl-P to open buffers
* `,l` brings up [Tagbar](https://github.com/majutsushi/tagbar)
    - Then 'p' jumps to the definition
* `Ctrl]` jump to definition using ctags
* `,f` Fold current function
* `,[space]` strips trailing whitespace
* Debugging keys
    - `F5` Make Vim try and connect to the debugger
    - `F3` Step through the functions
    - `F2` Step into a function
    - `F4` Step out of a function
    - `CtrlB` Set a breakpoint for VDebug

### Git integration with fugitive

* Resolving 3-way merge conflicts with fugitive tutorial [here] (http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff/)
    - Open up the conflicted file and run **:Gdiff** which will open up two extra buffers with the target (i.e. the branch you're currently on) on the left and merge (i.e. the branch you're merging in) on the right
    - Fugitive usually has a consistent naming structure for buffspec for these two, so the target would be //2 and the merge would be //3
    - `]c` jumps to the next merge conflict marker
    - `[c` jumps to the previous merge conflict marker
    - Use **:diffget //2** to get changes from the target or **:diffget //3** to get changes from the merge
    - Use **:diffupdate** to realign the diff markers
    - Once we're happy, use **:only** to keep the current window and close the other buffers
    - Use **:Gwrite** to stage changes **:Gcommit** to commit them and **:Gpush <remote> <branch>** to push them

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

Finally, you can use my vimrc

    ln -s .vim/vimrc .vimrc
