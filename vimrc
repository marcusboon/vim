:set nocompatible
:set ts=2
:set sw=2
:set sta
:set sts=2
:set sr
:set et
:set si
:set gfn=Monaco\ Arial\ Monospaced\ 9
:set lsp=1
:set ghr=160
:set number
:syntax on
:set t_Co=256
:colorscheme wombat256mod
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set smartindent
:set paste
:set ruler
:set makeprg=php\ -l\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
:set tags+=tags;
:match Error /\t\|\s\+$/

"Use pathogen to manage plugins"
execute pathogen#infect()

"For easier buffers, this maps F5 to show buffers"
:nnoremap ` :buffers<CR>:buffer<Space>

"For a more awesome git blame"
"Type gs to show this"
map gs :execute('!php ~/.vim/plugin/gs.php % ' . line('.'))<cr>

"NERDTree stuff"
"Automatically load nerdtree when we open vim"
autocmd vimenter * if !argc() | NERDTree | endif

"Toggle nerdtree with keypress"
map <C-n> :NERDTreeToggle<CR>

"Close vim when only nerdtree is left"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Fix weird chars"
let g:NERDTreeDirArrows=0
