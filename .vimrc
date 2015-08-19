" .vimrc file

execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()


syntax enable
set number
set nocompatible
set background=dark
colorscheme molokai
filetype plugin indent on

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"NERDTree Settings
map <C-n> :NERDTree
let NERDTreeShowHidden = 1
set backupdir=$TMPDIR
set directory=$TMPDIR
autocmd vimenter * NERDTree

"Syntastic Settings
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_erros=1
let g:syntastic_javascript_checkers = ['jshint']

"pane navigation
map <C-h> <C-W><A-Left>
map <C-j> <C-W><A-Down>
map <C-k> <C-W><A-Up>
map <C-l> <C-W><A-Right>

"Resize NERDTree if opening with only the NERDTree pane already present"
function! NerdTreeOpenFunc(action, line)
    "Check that the initial buffer is NERD tree and there are only two windows"
    if (winnr("$") ==# 2 && bufname(winbufnr(1)) == "NERD_tree_1")
        let size = g:NERDTreeWinSize
        call call('ctrlp#acceptfile', [a:action, a:line])
        "Resize the NERDTree window to it's original size"
        exec("silent wincmd h")
        exec("silent vertical resize ". size)
        exec("silent wincmd p")
    else
        call call('ctrlp#acceptfile', [a:action,a:line])
    endif
endfunction

set incsearch
set hlsearch

set splitbelow
set splitright

set pastetoggle=<F2>

set wrapmargin=0
set history=50

set showmode
set showcmd

set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set autoindent

filetype on
filetype indent on
filetype plugin on

autocmd FileType mail,human set formatoptions+= textwidth=72
autocmd FileType c,cpp,slang set cindent

autocmd FileType perl set smartindent

"HTML
autocmd FileType html set formatoptions+=t1
autocmd FileType html,css set noexpandtab tabstop=2

autocmd FileType make set noexpandtab shiftwidth=8

set ignorecase
set smartcase

let g:neocomplete#enable_at_startup = 1



