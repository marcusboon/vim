"Don't bother with vi compatibility"
set nocompatible

"Use pathogen to manage plugins"
call pathogen#infect()                              "Run pathogen to install plugins"
call pathogen#helptags()                            "Run pathogen to generate helpfiles for plugins"
filetype plugin indent on                           "Enable loading indent file for filetype"

set softtabstop=4                                   "Make spaces feel like tabs (like deleting)"
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
set ruler                                           "Always show where you are"
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
set tags=tags,../tags,../../tags,../../../tags,../../../../tags,../../../../../tags,../../../../../../tags,../../../../../../../tags                             "Make use of exuberant ctags"
match Error /\t\|\s\+$/                             "Show trailing whitespace as ugly red blocks"
set backspace=indent,eol,start                      "Fix this weird backspace issue deleting lines"
set wildmenu                                        "Enable a menu at the bottom of the window"
set wildmode=list:longest,full                      "Something to do with completion in command line"
set mouse=a                                         "Turn on mouse support"
set completeopt=longest,menuone                     "Completion menu matches longest and shows even 1"
set encoding=utf-8                                  "Make vim use utf8"

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
"Automatically load nerdtree when we open vim and no files are specified"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Toggle nerdtree with keypress"
map <leader>n :NERDTreeToggle<CR>
"Close vim when only nerdtree is left"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Fix weird chars"
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"For easier buffers, this maps ` to show buffers"
nnoremap ` :buffers<CR>:buffer<Space>

"Strip extra whitespace"
nmap <leader><space> :call whitespace#strip_trailing()<CR>

"Setup syntastic code checker"
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1
let g:syntastic_php_phpcs_args="--standard=moodle --extensions=php"
let g:syntastic_php_phpmd_post_args = "~/.vim/phpmdruleset.xml"
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1

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
let g:SuperTabDefaultCompletionType = "context"
let php_sql_query=1
let php_htmlInstrings=1

"Tagbar"
let g:tagbar_usearrows=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
nnoremap <leader>l :TagbarToggle<CR>

"Gundo stuff"
nnoremap <leader>u :GundoToggle<CR>

"Update tags"
nnoremap <leader>t :silent execute "!~/.vim/ctaggify &>/dev/null &"\|redraw!<CR>

"List all matching tags, their location and type"
"nnoremap <C-]> :tselect <C-R><C-W><CR>

"Change settings based on path.
function! SetDrupal()
    setlocal tabstop=2 shiftwidth=2 softtabstop=2
    let g:syntastic_php_phpcs_args="--standard=drupalcatalyst --extensions=php"
endfunction
au BufNewFile,BufRead **/drupal* call SetDrupal()

function! SetCommon()
    setlocal tabstop=2 shiftwidth=2 softtabstop=2
    let g:syntastic_php_phpcs_args="--standard=Zend --extensions=php"
endfunction
au BufNewFile,BufRead **/common* call SetCommon()

" Change the highlight colour
let g:vawahl="ctermbg=239 guibg=#4e4e4e gui=bold"

"Close the location list if its the only thing open
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

"Setup for snipmate
let g:snips_author = 'Marcus Boon<marcus@catalyst-au.net>'

" Syntax for ruby files
au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Jump to definition if there is only one, or else show list of definitions to
" choose from if there are multiple.
nnoremap <c-]> g<c-]>

" Shortcut for git blame
nnoremap gb :Gblame<CR>
