"Don't bother with vi compatibility"
set nocompatible

"Use pathogen to manage plugins"
call pathogen#infect()                              "Run pathogen to install plugins"
call pathogen#helptags()                            "Run pathogen to generate helpfiles for plugins"
filetype plugin indent on                           "Enable loading indent file for filetype"

set softtabstop=2                                   "Make spaces feel like tabs (like deleting)"
set sr
set gfn=Monaco\ Arial\ Monospaced\ 9
set lsp=1
set ghr=160                                         "GUI headroom"
set number                                          "Always show line numbers"
syntax on                                           "Syntax highlighting"
set t_Co=256                                        "Enable 256 colours in vim"
colorscheme wombat256mod                            "Enable the wombat theme"
set expandtab                                       "Expand tabs to spaces"
set tabstop=4                                       "Set tab width to 4 spaces"
set shiftwidth=4                                    "Normal mode indentation commands use 4 spaces"
set laststatus=2                                    "Always show status line"
set autoindent                                      "Automatically indent text"
set smartindent
set paste
set ruler                                           "Always show where you are"
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set tags+=tags                                      "Make use of exuberant ctags"
match Error /\t\|\s\+$/                             "Show trailing whitespace as ugly red blocks"
set backspace=indent,eol,start                      "Fix this weird backspace issue deleting lines"

"Statusline setup"
set statusline=%{fugitive#statusline()}             "Current git branch"
set statusline+=%f                                  "Full filepath"
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},   "File encoding"
set statusline+=%{&ff}]                             "File format"
set statusline+=%h                                  "Help file flag"
set statusline+=%m                                  "Modified flag"
set statusline+=%r                                  "Read only flag"
set statusline+=%y                                  "Filetype"
set statusline+=%=                                  "Left/right separator"
set statusline+=%c,                                 "Cursor column"
set statusline+=%l/%L                               "Cursor line/total lines"
set statusline+=\ %P                                "Percent through file"

"Keyboard shortcuts"
let mapleader = ','

"Code folding"
let php_folding=1
set foldmethod=syntax
set foldlevel=99
map <leader>f za<CR>

"CTRL-P stuff"
"Toggle ctrl-p"
map <leader>p :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

"NERDTree stuff"
"Automatically load nerdtree when we open vim"
autocmd vimenter * if !argc() | NERDTree | endif

"Toggle nerdtree with keypress"
map <leader>n :NERDTreeToggle<CR>

"Close vim when only nerdtree is left"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Fix weird chars"
let g:NERDTreeDirArrows=0

"For easier buffers, this maps F5 to show buffers"
nnoremap ` :buffers<CR>:buffer<Space>

"Strip extra whitespace"
nmap <leader><space> :call whitespace#strip_trailing()<CR>

"Setup syntastic code checker"
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1

"Vdebug stuff"
let g:vdebug_options = {
\ 'server': '0.0.0.0',
\ 'port': '9000',
\ 'on_close': 'detach'
\}
map <c-b> :Breakpoint<CR>

"Autocompletion"
filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"Set it so that vims popup menu does not select the first completion item"
set completeopt=longest,menuone

"Tagbar"
let g:tagbar_usearrows=1
nnoremap <leader>l :TagbarToggle<CR>
