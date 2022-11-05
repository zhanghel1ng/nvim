vim.g.mapleader = ' '


vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', '<leader>wc', '<c-w>c')

-- window resize
vim.keymap.set('n', '<a-9>', '<c-w><')
vim.keymap.set('n', '<a-0>', '<c-w>>')
vim.keymap.set('n', '<a-->', '<c-w>-')
vim.keymap.set('n', '<a-=>', '<c-w>+')

-- b: buffer
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bd', ':Bdelete<cr>')

-- file tree
vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ec', ':NvimTreeFocus<CR>')

-- telescope
vim.keymap.set('n', '<leader>ff', function() require 'telescope.builtin'.find_files {} end) --
vim.keymap.set('n', '<leader>fg', function() require 'telescope.builtin'.git_files {} end)
vim.keymap.set('n', '<leader>fb', function() require 'telescope.builtin'.buffers {} end)
vim.keymap.set('n', '<leader>fl', function() require 'telescope.builtin'.live_grep {} end)
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
-- vim.keymap.set('n', '<leader>hu', ':Gitsigns undo_stage_hunk<cr>')
-- vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
-- vim.keymap.set('n', '<leader>hc', ':Gitsigns preview_hunk<cr>')
-- vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<cr>')
-- vim.keymap.set('n', '<leader>hR', ':Gitsigns reset_buffer')
-- vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>')
-- vim.keymap.set('n', '<leader>hd', ':Gitsigns diffthis<cr>')
-- vim.keymap.set('n', '<leader>hs', ':<C-U>Gitsigns select_hunk<CR>')

-- lsp
vim.keymap.set('n', '<leader>le', ':Lspsaga show_line_diagnostics<cr>')
vim.keymap.set('n', '<leader>lE', ':Lspsaga show_cursor_diagnostics<cr>')
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', 'gh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>ld', ':Lspsaga peek_definition<cr>')
vim.keymap.set('n', '<leader>lr', ':Lspsaga rename<cr>')
vim.keymap.set('i', '<C-p>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end)
vim.keymap.set('n', '<leader>lb', ':SymbolsOutline<cr>')
vim.keymap.set('n', '<leader>la', ':Lspsaga code_action<cr>')
vim.keymap.set('n', '<leader>lu', ':Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<F12>', ':Lspsaga code_action<cr>')
-- vim.keymap.set('n', '<leader>it', function() require('rust-tools.inlay_hints').toggle_inlay_hints() end)
-- vim.keymap.set('n', '<leader>is', function() require('rust-tools.inlay_hints').set_inlay_hints() end)
-- vim.keymap.set('n', '<leader>id', function() require('rust-tools.inlay_hints').diable_inlay_hints() end)
vim.keymap.set('n', '<f4>', ':SymbolsOutline<cr>')

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_prev<cr>')
vim.keymap.set('n', ']e', ':Lspsaga diagnostic_jump_next<cr>')
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)

vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

vim.keymap.set('n','<leader>wj',function () require("trouble").next({skip_groups = true, jump = true}) end)
vim.keymap.set('n','<leader>wk',function () require("trouble").previous({skip_groups = true, jump = true}) end)

-- java
vim.keymap.set('n','<A-o>',function() require'jdtls'.organize_imports() end)
vim.keymap.set('n','crv',function() require('jdtls').extract_variable() end)
vim.keymap.set('v','crv',function() require('jdtls').extract_variable(true) end)
vim.keymap.set('n','crc',function() require('jdtls').extract_constant() end)
vim.keymap.set('v','crc',function() require('jdtls').extract_constant(true) end)
vim.keymap.set('v','crm',function() require('jdtls').extract_method(true) end)
-- debug
vim.keymap.set('n', ',b', function() require 'dap'.toggle_breakpoint() end)
vim.keymap.set('n', ',d', function() require 'dap'.continue() end)
vim.keymap.set('n', '<leader>di', function() require 'dap'.step_into() end)
vim.keymap.set('n', '<leader>do', function() require 'dap'.step_over() end)
