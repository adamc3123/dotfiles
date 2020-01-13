"
" SETUP
" - Create a '.swaps' directory in .vim
" - Follow installation steps at https://github.com/junegunn/vim-plug
"
" Use '==' to automatically indent single lines or visual blocks
"
"

"
" vim-plug setup
"
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
call plug#end()

if (has("termguicolors"))
  set termguicolors
 endif

colorscheme onedark
"colorscheme elflord

set number          " Show line number

syntax on           " Syntax highlighting

set mouse=a         " Enable mouse support

set wildmenu		" autocomplete command menu

set nocompatible

set tabstop=4		" 4 spaces per tab
set expandtab		" tabs are spaces
set shiftwidth=4
set nowrap

set incsearch		" search as typing
set hlsearch		" highlight matches
set ignorecase		" search case insensitive
set smartcase		" allow uppercase search

"
" Status line
"
set laststatus=2
set statusline=%-f%m\ %r\ %y%=BUFF=%n\ %l,%c
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set directory^=$HOME/.vim/.swaps//      " Common .swp file location

"
" File auto indent
"
filetype plugin indent on
"autocmd FileType ruby setlocal expandtab shiftwidth=4 tabstop=4
"autocmd FileType eruby setlocal expandtab shiftwidth=4 tabstop=4

"
" Highlights bad whitespace red
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"
" NERDTree specific
"
let NERDTreeShowHidden=1                "  Always show dot files

" Toggle NERDTree window
map _ :NERDTreeToggle<CR>

" select NERDTree window
map <leader>r :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Exit if NERDTree is last window open
" If more than one window and previous buffer was NERDTree, go back to it.
"autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif


"
" Code snippets
"

" Insert ruby block comment
nnoremap ,rcom :-1read $HOME/.vim/snippets/ruby_comment.txt<CR>1ja


"
" Misc mappings
"

" go to previous buffer and close the current buffer
nnoremap bdc :b#\|bd #<CR>

