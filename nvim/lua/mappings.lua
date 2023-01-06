local map = vim.keymap.set

map('n', '<leader>sm', ':source $MYVIMRC<cr>')

map('n', '!', ':!')

-- Toggle nowrap
map('n', '<leader>nw', ':set nowrap!<cr>', { silent = true })

-- Close other windows
map('n', '<leader>wo', ':only<cr>')

-- Ctrl-B remap
map('n', '<C-m>', '<C-b>')

-- Move in windows
-- map('n', '<tab>', ':wincmd w<cr>')
map('n', '<leader>ww', ':wincmd w<cr>')

-- Previous buffer
map('n', '<leader><space>', ':b#<cr>')
-- delete buffer
map('n', '<leader>wd', ':bd<cr>')
-- delete buffer and file
map('n', '<leader>wD', ':!rm %<cr>:bd!<cr>')
-- Copy current file path to registers "* and "+
map('n', '<leader>cp', ':let @*=@%<cr>:let @+=@%<cr>')

-- Yank from the cursor to the end of the line, to be consistent with C and D.
map('n', 'Y', 'y$')

-- prevent ctrl-z
map("n", "<C-z>", "<nop>")

-- Use space as " shortcut
-- map('n', '<space>', '"')
-- map('v', '<space>', '"')

-- Swap two words
-- map('n', 'gw', ":s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'", { silent = true })
-- map('n', 'gW', ":s/\(\%#[^\s]\+\)\(\_W\+\)\([^\s]\+\)/\3\2\1/<CR>`'", { silent = true })

-- Clear search highlight
map('n', '<leader>/', ':nohl<cr>', { silent = true })

-- Start a substitute
map('n', '<leader>ss', ':%s/\v')

-- Pull word under cursor into LHS of a substitute (for quick search and replace)
map('n', '<leader>zs', ':%s#<C-r>=expand("<cword>")<cr>#')

map('n', '<leader>zs', ':%s#<C-r>=expand("<cword>")<cr>#')
-- Use perl regex style
-- map('n', '/', "/\v")
-- map('v', '/', "/\v")
-- map('n', '?', "?\v")
-- map('v', '?', "?\v")

-- Search to quickfix
-- map('n', '<leader>rg', ':Rg<space>')

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Open omnicomplete with tab
-- map('i', '<Tab>', '<C-x><C-o>')

-- Fast save (also clears the search)
map('', '<C-s>', ':nohl<cr>:w<cr>')
map('i', '<C-s>', '<esc>:nohl<cr>:w<cr>')
map('', '<C-S-S>', ':nohl<cr>:noa w<cr>')
map('i', '<C-S-S>', '<esc>:nohl<cr>:noa w<cr>')

-- Previous element during omnicomplete (<C-e> is used for fast save)
map('i', '<C-k>', [[pumvisible() ? "\<C-p>" : "\<C-k>"]], { expr = true })

-- Reselect text that was just pasted with ,v
map('n', '<leader>v', 'V`]')

-- wordwise yank from line above
vim.cmd([[
inoremap <silent> <C-Y> <C-C>:let @z = @"<cr>mz
      \:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<cr>
      \:exec (col('.')==col('$')-1 ? 'let @" = @_' : 'normal! yw')<cr>
      \`zp:let @" = @z<cr>a
]])

-- Make the current file executable
map('n', '<leader>%', ':!chmod +x %<cr>')

-- Expand current filed dir in console mode
map('c', '%%', "<C-R>=expand('%:h').'/'<cr>")

-- Jump to line AND col
map('n', "'", '`')
