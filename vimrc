"Don't bother with vi compatibility"
:set nocompatible

"Use pathogen to manage plugins"
:execute pathogen#infect()

:set ts=2
:set sw=2
:set sta
:set sts=2
:set sr
:set gfn=Monaco\ Arial\ Monospaced\ 9
:set lsp=1
:set ghr=160                                        "GUI headroom"
:set number                                         "Always show line numbers"
:syntax on                                          "Syntax highlighting"
:set t_Co=256                                       "Enable 256 colours in vim"
:colorscheme wombat256mod                           "Enable the wombat theme"
:set expandtab                                      "Expand tabs to spaces"
:set tabstop=4                                      "Set tab width to 4 spaces"
:set shiftwidth=4                                   "Normal mode indentation commands use 4 spaces"
:set laststatus=2                                   "Always show status line"
:set autoindent                                     "Automatically indent text"
:set smartindent
:set paste
:set ruler                                          "Always show where you are"
:set makeprg=php\ -l\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
:set tags+=tags;
:match Error /\t\|\s\+$/                            "Show trailing whitespace as ugly red blocks"
:set backspace=indent,eol,start                     "Fix this weird backspace issue deleting lines"

"Keyboard shortcuts"
:let mapleader = ','

"Command-T stuff"
"Toggle command-t"
:map <leader>t :CommandT<CR>
:map <leader>b :CommandTBuffer<CR>
:map <leader>j :CommandTJump<CR>

"NERDTree stuff"
"Automatically load nerdtree when we open vim"
":autocmd vimenter * if !argc() | NERDTree | endif

"Toggle nerdtree with keypress"
:map <leader>n :NERDTreeToggle<CR>

"Close vim when only nerdtree is left"
:autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Fix weird chars"
:let g:NERDTreeDirArrows=0

"For easier buffers, this maps F5 to show buffers"
:nnoremap ` :buffers<CR>:buffer<Space>

"For a more awesome git blame"
"Type gs to show this"
:map <leader>g :execute('!php ~/.vim/plugin/gs.php % ' . line('.'))<cr>

:nmap <leader><space> :call whitespace#strip_trailing()<CR>
