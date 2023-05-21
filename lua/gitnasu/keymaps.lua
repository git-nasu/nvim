local keymap = vim.keymap

local opts = { noremap = true, silent = true }
local term_opt = { silent = true }


-- Rename space as leader
keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Modes
-- normal_mode 'n'
-- insert_mode 'i'
-- visual_block_mode 'x'
-- term_mode 't'
-- command_mode 'c'


-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- No hlsearch
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- Exit insert mode
keymap.set('i', 'jj', '<Esc>')

--Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

--Delete a word backward
keymap.set('n', 'dw', 'vb"_d')

--Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

--New tab
keymap.set('n', 'te', ':tabedit')

--End of line yanked
keymap.set('n', 'Y', 'y$', opts)

--Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

--Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h', opts)
keymap.set('', 'sj', '<C-w>j', opts)
keymap.set('', 'sk', '<C-w>k', opts)
keymap.set('', 'sl', '<C-w>l', opts)

--Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Visual
keymap.set('v', '<', '<gt', opts)
keymap.set('v', '>', '>gt', opts)

-- Select end of line on visual mode
keymap.set('v', 'v', '$h', opts)

-- Exit visual mode
keymap.set('v', 'vv', '<Esc>', opts)

--Move text up and down
keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)
keymap.set('v', 'p', '"_dp', opts)

--Bufferline keymaps
vim.api.nvim_set_keymap('n', '<Tab>', '<Cmd>BufferLineCricleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<Cmd>BufferLineCirclePrev<CR>', {})
