local function keymap(mode, key, value)

  vim.keymap.set(mode, key, value, {silent = true})
end

vim.g.mapleader = ' '

-- ctrl+s save file
keymap('n', '<c-s>', '<cmd>update<cr>')

-- ctrl+h no highlight search terms, back on when searching
keymap('n', '<leader>h', '<cmd>nohlsearch<cr>')

-- map Q to no-operation to disable ex mode
keymap('n', 'Q', '<nop>')

-- visual-block mode on V press, again for visual-line
keymap('n', 'V', '<c-q>')

-- toggle show whitespace by ctrl+l
keymap('n', '<c-l>', '<cmd>set invlist list?<cr>')

-- make file executable
keymap('n', '<leader>x', '<cmd>!chmod +x %<cr>', { silent = true })

-- explore mode
keymap('n', '<leader>e', vim.cmd.Ex)

-- source / reload
keymap('n', '<leader><leader>', vim.cmd.source)

-- paste no copy
keymap('x', '<leader>p', [["_dP]])

-- delete no copy
keymap({'n', 'v'}, '<leader>d', [["_d]])

-- keep cursor centered when going up or down
keymap('n', '<c-d>', '<c-d>zz')
keymap('n', '<c-u>', '<c-u>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

-- split navigation ctrl+hjkl
keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')

-- reload current file
keymap('n', '<leader>r', '<cmd>edit!<cr>')
