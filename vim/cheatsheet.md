Vim/Neovim cheatsheet
=====================

## Vim help pages navigation
CTRL-]          Follow a link
CTRL-t          Go back

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

## Search command history
q:                          Open command history in a window
:<CR> + Ctrl-f              Open the command prompt and then open the command search prompt
:History: OR <leader>h      Open command history in FZF preview window

## Copy to system clipboard
yank the text in Visual mode. The text will then be in the system clipboard.

## Gitgutter
<leader>hp      hunk preview
<leader>hu      hunk undo
<leader>hs      hunk stage

## Fugitive
:G blame        View git blame for the file
:G blame o      View commit changes

## CtrlP
<leader>p       Mixed search (buffers, files, MRU)

## FZF
:Rgp            Global Project search ($PROJECT_SRC_DIRS)
<leader>F       Global Project search (calls :Rgp)
<leader>f       File search
<leader>b       Buffer search
<leader>h       Command history search
CTRL-X          Open in a new split (While in the finder window)
CTRL-V          Open in a new vertical split (While in the finder window)

## Coc.nvim
CTRL-n          Scroll down in selection window
CTRL-p          Scroll up in selection window

## Source the current file
:source %

## vim-workspace
:CloseHiddenBuffers     Closes all buffers except the current buffer

## Tips
==              Use to indent a single line or visual block

~               Switch case of the character under the cursor
{Visual}U       Switch case of highlighted text

