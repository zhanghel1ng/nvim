vim.g.mapleader = ' '
-- base opration
vim.keymap.set('i','jj','<ESC>')
vim.keymap.set('n','L','$')
vim.keymap.set('n','H','^')
vim.keymap.set('n','<leader>wc','<c-w>c')
vim.keymap.set('n','<leader>wh','<c-w>h')
vim.keymap.set('n','<leader>wj','<c-w>j')
vim.keymap.set('n','<leader>wk','<c-w>k')
vim.keymap.set('n','<leader>wl','<c-w>l')

-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')

-- file tree
vim.keymap.set('n','<leader>ee',':NvimTreeToggle<CR>')
vim.keymap.set('n','<leader>ec',':NvimTreeFocus<CR>')

-- telescope
vim.keymap.set('n', '<leader>ff', function() require 'telescope.builtin'.find_files {} end)-- 
vim.keymap.set('n', '<leader>fg', function() require 'telescope.builtin'.git_files {} end)
vim.keymap.set('n', '<leader>fb', function() require 'telescope.builtin'.buffers {} end)
vim.keymap.set({ 'n', 'i' }, '<C-p>', function() require 'telescope.builtin'.registers {} end)

-- t: terminal
-- use <f5> to toggle terminal, this can be set in lua/configs/terminal.lua
-- the default position is also set in lua/configs/terminal.lua
vim.keymap.set('t', '<C-g>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=tab<cr>')
vim.keymap.set('n', '<leader>tn', function() require('toggleterm.terminal').Terminal:new():toggle() end)
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<cr>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<cr>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<cr>')

-- h: git
vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')
