-- themes
--

-- themes with special settings

-- vim.cmd('colorscheme tender')
--  sonokai
-- nord
vim.g.nord_contrast                = false
vim.g.nord_borders                 = false
vim.g.nord_disable_background      = false
vim.g.nord_italic                  = false
vim.g.nord_uniform_diff_background = true
vim.g.cursorline_transparent       = true
require('nord').set()
-- vim.cmd('colorscheme nord')
-- local hours                        = os.date("%H")
-- local hour                         = tonumber(hours)
-- if hour > 10 and hour < 18 then
--     vim.cmd('set background=light')
--     vim.cmd('colorscheme rose-pine')
-- else
--     -- vim.cmd('colorscheme gruvbox')
--     -- vim.cmd('colorscheme onedark')
--     vim.cmd('colorscheme nord')
-- end
-- vim.cmd('colorscheme habamax')
-- vim.cmd('colorscheme edge')
require("transparent").setup({
    extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups

        -- example of akinsho/nvim-bufferline.lua
        -- "BufferLineTabClose",
        -- "BufferlineBufferSelected",
        -- "BufferLineFill",
        -- "BufferLineBackground",
        -- "BufferLineSeparator",
        -- "BufferLineIndicatorSelected",
    },
})

-- github
-- vim.cmd("colorscheme github_dark_default")

-- oxocarbon
-- vim.cmd("colorscheme oxocarbon-lua")

-- vim.cmd("set background=dark")
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- require("indent_blankline").setup {
--     space_char_blankline = " ",
-- }
-- everforest
-- vim.cmd('set background=light')
-- dracula
vim.g.dracula_italic = 0
vim.g.everforest_sign_column_background = 'none'
vim.g.everforest_disable_italic_comment = 1
-- vim.g.everforest_background = 'hard'
-- vim.g.everforest_transparent_background = 1
-- vim.cmd("colorscheme everforest")
-- vim.g.gruvbox_material_sign_column_background = 'none'
vim.g.gruvbox_material_disable_italic_comment = 1
-- vim.g.gruvbox_material_background = 'soft'
-- vim.cmd("colorscheme gruvbox-material")
vim.g.sonokai_sign_column_background = 'none'
vim.g.sonokai_disable_italic_comment = 1
vim.g.gruvbox_bold = false
vim.cmd("colorscheme everforest")

