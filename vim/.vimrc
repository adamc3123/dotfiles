"
" SETUP
"   - Install neovim
"   - Create a '.swaps' directory in .vim
"   - Follow installation steps at https://github.com/junegunn/vim-plug
"   - Create environment variables:
"     - $RUBOCOP_YML - Path to rubocop config file
"   - Might need to use a powerline font for nice statusline icons
"     - Currently using p10k default font
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
"Plug 'mhartington/oceanic-next'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
Plug 'thaerkh/vim-workspace'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'yggdroot/indentline'
Plug 'morhetz/gruvbox'
"Plug 'tomasr/molokai'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'airblade/vim-rooter
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ggandor/leap.nvim'
call plug#end()

:lua << EOF
require('telescope').setup {
    extensions = {
        project = {
            hidden_files = false
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')

require('leap').add_default_mappings()
EOF

if (has("termguicolors"))
  set termguicolors
 endif

"colorscheme onedark
colorscheme gruvbox

set number              " Show current line number
set relativenumber      " Show relative line numbers

syntax on               " Syntax highlighting

set mouse=a             " Enable mouse support

set wildmenu		    " Autocomplete command menu

set nocompatible

set tabstop=2		    " 2 spaces per tab
set expandtab		    " Tabs are spaces
set shiftwidth=2
set nowrap

set incsearch		    " Search as typing
set hlsearch		    " Highlight matches
set ignorecase		    " Search case insensitive
set smartcase		    " Allow uppercase search

set hidden              " Allow hidden unsaved buffers

let mapleader=" "       " Use space as the leader key

set updatetime=500      " Lower update time for vim-gitgutter

if (has("nvim"))
  set signcolumn=yes:2   " Show 2 rows in the gutter
endif

set clipboard+=unnamedplus  " Copy to system clipboard

set laststatus=2  " Show a statusline in each window

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set directory^=$HOME/.vim/.swaps//      " Common .swp file location

set scrolloff=5         " Minimal number of screen lines to keep above and below the cursor
set sidescrolloff=5     " Minimal number of columns to keep left and right of the cursor

"
" File auto indent
"
filetype plugin indent on
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2

"
" Recognize handlebar files at html
"
autocmd BufEnter *.hbs :setlocal filetype=html

"
" Highlight extra whitespace
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"
" Read vimrc in the current directory to support project specific config
"
"set exrc
"set secure

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

"
" vim-workspace specific
"
let g:workspace_autosave = 0

"
" vim-airline specific
"
let g:airline#extensions#tabline#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"
" fzf.vim specific
"
" NOTE: Project specific fzf commands are in <project_directory>/.nvimrc
"
" Search for word under cursor
"nnoremap <leader>F :Rg <C-R><C-W><CR>
"nnoremap <leader>f :Files<Cr>
"nnoremap <leader>b :Buffers<Cr>
"nnoremap <leader>h :History:<Cr>

"
" Ale specific
" NOTE: Need to install rubocop-performance and rubocop-rails for rubocop to work
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters_explicit = 1              " Only run linters named in ale_linters settings.
let g:ale_lint_on_text_changed = 0          " Don't lint on text change
let g:ale_lint_on_insert_leave = 0          " Don't lint on insert leave
let g:ale_lint_on_enter = 0                 " Don't lint on open
let g:ale_ruby_rubocop_options = "--config $RUBOCOP_YML"
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'
highlight ALEWarning cterm=underline ctermfg=173 gui=underline guifg=#D19A66

"
" Telescope
"
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
" Grep for string under the cursor
nnoremap <leader>F <cmd>Telescope grep_string<cr>
nnoremap <leader>b <cmd>:lua require('telescope.builtin').buffers({sort_mru = true})<cr>
nnoremap <leader>h <cmd>Telescope command_history<cr>
nnoremap <leader>t <cmd>Telescope help_tags<cr>
nnoremap <leader>p <cmd>Telescope project<cr>

"
" coc.nvim
"
let g:coc_global_extensions = ['coc-tsserver', 'coc-solargraph', 'coc-css']

"
" Code snippets
"

" Insert ruby block comment
nnoremap ,rcom :-1read $HOME/.vim/snippets/ruby_comment.txt<CR>1ja


"
" Misc mappings
"

" Interactively delete buffers
" Open with :BD. Use tab to select multiple buffers to delete
" https://github.com/junegunn/fzf.vim/pull/733
"
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bdelete' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

"
" Copy filename to the clipboard
"
nnoremap <leader>cp :let @+ = expand("%")<cr>

" Create a scratch buffer with :Scratch
function! Scratch()
    split
    noswapfile hide enew
    setlocal buftype=nofile
    setlocal bufhidden=hide
    file scratch
endfunction
command! -bar -nargs=* Scratch call Scratch()
