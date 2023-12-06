Vim/Neovim cheatsheet
=====================

## Vim help pages navigation
CTRL-]          Follow a link
CTRL-t          Go back

## Scrolling/motion
w               words forward
e               forward to the end of a word
b               backward to the start of a word
z.              Center cusor in middle of the screen
{               Paragraphs forward
}               Paragraphs backward

## Windows
CTRL-w k        Select the window to the top
CTRL-w j        Select the window to the bottom
CTRL-w h        Select the window to the left
CTRL-w l        Select the window to the right
CTRL-w p        Select the previous window

CTRL-w K        Move the current window to the very top
CTRL-w J        Move the current window to the very bottom
CTRL-w H        Move the current window to the far left
CTRL-w L        Move the current window to the far right

CTRL-w =        Make all windows equal in height and width
CTRL-w |        Make current window very wide

## Search command history
q:                          Open command history in a window
:<CR> + Ctrl-f              Open the command prompt and then open the command search prompt
:History: OR <leader>h      Open command history in FZF preview window

## Copy to system clipboard
yank in Visual mode will copy to the system clipboard.

## Working with files
:f              Show the filename for the current buffer

## Gitgutter
<leader>hp      hunk preview
<leader>hu      hunk undo
<leader>hs      hunk stage

## Fugitive
:G blame        View git blame for the file
:G blame o      View commit changes
:GBrowse        View file/commit/PR in Github (Can also use this after selection in visual mode)

## Coc.nvim
CTRL-n          Scroll down in selection window
CTRL-p          Scroll up in selection window
TAB             Confirm completion
gd              Go to definition (C-o to go back)
gr              Go to or view references (C-o to go back)
K               View documentation for symbol under cursor
CTRL-space      Trigger completion

## Telescope
### Pickers + shortcuts
<leader>f             File search
<leader>g             Grep
<leader>F             Find word under the cursor
<leader>b             Buffer search
<leader>ch            Command history search
<leader>t             Search help tags
<leader>p             Search projects
:Telescope oldfiles   Search old files

### Picker options
CTRL-X          Open in a new split (While in the finder window)
CTRL-V          Open in a new vertical split (While in the finder window)
?               Show available commands while in normal mode
CTRL-?          Show available commands while in insert mode
M-q             Send selected to quickfix list (Select with tab)

### Telescope live grep picker (<leader>g)
Can pass arguments directly to rg when using the live grep picker
CTRL-k          Quote the current text (can then add rg options)
CTRL-i          Quote the current text and add option to search for case-insensitve glob
CTRL-t          Quote the current text and add option to search for file type (ruby haml js ts)

## Source the current file
:source %

## vim-workspace
:CloseHiddenBuffers     Closes all buffers except the current buffer
:ToggleWorkspace        Create a workspace session. Remembers current buffers and layout

## NERDTree
<leader>-       Open or close the NERDTree directory tree
<leader>r       Open the current file in the NERDTree directory tree

## Tips
==                        Auto indent a single line or visual block
=ap                       Auto indent the paragraph
~                         Switch case of the character under the cursor
{Visual}U                 Switch case of highlighted text
:vnew                     Open a new vertial split window
gt                        Same as :tabnext
gT                        Same as :tabnext
:verbose imap <command>   **Search for mappings (Ex: <leader>h). Helpful for determining if a mapping is in use
