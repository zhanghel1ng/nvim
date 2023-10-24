-- basics
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number         = true
vim.opt.relativenumber = true
-- vim.opt.termguicolors  = true
vim.opt.shiftround     = true
vim.opt.updatetime     = 100
vim.opt.cursorline     = true
vim.opt.autowrite      = true
vim.opt.ignorecase     = true
vim.opt.smartcase      = true
vim.opt.signcolumn     = "yes"
if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end
-- vim.opt.termguicolors = true
-- tabs
vim.opt.autoindent    = true
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.softtabstop   = 4
vim.opt.mouse         = 'a'
vim.opt.expandtab     = true
-- vim.opt.autowrite     = false
vim.opt.formatoptions = ''
-- vim.opt.pumheight     = 10

--调整弹出菜单高度
local autocmd         = vim.api.nvim_create_autocmd
autocmd({ "CmdlineLeave", "VimEnter" }, {
    callback = function() vim.opt.pumheight = 10 end,
})
autocmd("CmdlineEnter", { callback = function() vim.opt.pumheight = 21 end,
})
require("core.keymaps")
--require("core.dvorak")	-- delete this line if you don't like using DVORAK

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("core.plugins")

require("core.gui")
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.loaded_matchparen        = 1
-- vim.g.loaded_matchit           = 9
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1
vim.g.loaded_nvim_tree         = 1
require("core.theme")

-- require('image').setup {
-- min_padding = 5,
-- show_label = true,
-- render_using_dither = true,
-- }

-- Load plugin configs
-- plugins without extra configs are configured directly here
require("impatient")
require("configs.dap.init")
require("configs.autocomplete").config()
require("configs.symbols_outline").config()
require("configs.statusline").config()
require("configs.filetree").config()
require("configs.treesitter").config()
require("configs.git").config()
require("configs.bufferline").config()
require("configs.grammar").config()
-- require("configs.terminal").config()
require("configs.tele").config()
require("configs.lspstyle").config()
require("configs.format").config()
require("configs.autotag").config()
-- require("configs.leap").config()
require("configs.tabout").config()
