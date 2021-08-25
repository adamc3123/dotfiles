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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
Plug 'thaerkh/vim-workspace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if (has("termguicolors"))
  set termguicolors
 endif

colorscheme onedark
"colorscheme elflord

set number              " Show line number

syntax on               " Syntax highlighting

set mouse=a             " Enable mouse support

set wildmenu		    " autocomplete command menu

set nocompatible

set tabstop=4		    " 4 spaces per tab
set expandtab		    " tabs are spaces
set shiftwidth=4
set nowrap

set incsearch		    " search as typing
set hlsearch		    " highlight matches
set ignorecase		    " search case insensitive
set smartcase		    " allow uppercase search

let mapleader=" "       " Use space as the leader key

set updatetime=500      " Lower update time for vim-gitgutter

set signcolumn=yes:2   " Show 2 rows in the gutter

set clipboard+=unnamedplus  " Copy to system clipboard

" Status line
"
set laststatus=2
"set statusline=%-f%m\ %r\ %y%=BUFF=%n\ %l,%c
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set directory^=$HOME/.vim/.swaps//      " Common .swp file location

"
" File auto indent
"
filetype plugin indent on
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

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
map <leader>- :NERDTreeToggle<CR>

" select NERDTree window
map <leader>r :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " Exit if NERDTree is last window open
" If more than one window and previous buffer was NERDTree, go back to it.
"autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

"
" vim-workspace specific
"
let g:workspace_autosave = 0

"
" vim-airline specific
"
let g:airline#extensions#tabline#enabled = 1

"
" fzf.vim specific
"
let $FZF_DEFAULT_COMMAND='rg --files -u'
" Search for word under cursor
nnoremap <leader>F :Rg <C-R><C-W><CR>
nnoremap <leader>f :Files<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>h :History:<Cr>
"nnoremap <leader>F :Rg <C-R>"<CR>           " Search for yanked phrase


"
" CtrlP specific
"
let g:ctrlp_user_command = 'rg --files -u %s'
nnoremap <leader>p :CtrlPMixed<CR>

"
" Ale specific
" NOTE: Need to install rubocop-performance and rubocop-rails for rubocop to
" work
"
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1              " Only run linters named in ale_linters settings.
let g:ale_lint_on_text_changed = 0          " Don't lint on text change
let g:ale_lint_on_insert_leave = 0          " Don't lint on insert leave
let g:ale_lint_on_enter = 0                 " Don't lint on open
let g:ale_ruby_rubocop_options = "--config $RUBOCOP_YML"
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'

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

