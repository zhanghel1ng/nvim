-- themes
--

-- themes with special settings

-- vim.cmd('colorscheme tender')
--  sonokai
--sonokai styles: default, atlantis, andromeda, shusia, maia, espresso
--vim.g.sonokai_style = 'default'
--vim.g.sonokai_enable_italic = 0
--vim.g.sonokai_disable_italic_comment = 0
--vim.cmd('colorscheme sonokai')

-- vim.cmd('colorscheme gruvbox')
require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = true,
	disable_italics = true,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})
local hours = os.date("%H")
local hour  = tonumber (hours)
if hour > 10 and hour < 18 then
    vim.cmd('set background=light')
    vim.cmd('colorscheme rose-pine')
else
    -- vim.cmd('colorscheme gruvbox')
    vim.cmd('colorscheme onedark')
end
require("transparent").setup({
  enable = false, -- boolean: enable transparent
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
  exclude = {}, -- table: groups you don't want to clear
})
-- vim.cmd(":Gitsigns toggle_signs")
-- vim.cmd('colorscheme molokai')
--
-- tokyo night
-- vim.g.tokyodark_transparent_background = false
--vim.g.tokyodark_enable_italic_comment = true
--vim.g.tokyodark_enable_italic = true
--vim.g.tokyodark_color_gamma = "1.0"
--vim.cmd("colorscheme tokyodark")

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
--vim.g.tokyonight_colors = { hint = "orange", error = "#cb5550" }
--vim.cmd('colorscheme sonokai')

-- space vim dark
-- vim.g.space_vim_dark_background = 234 -- 234 (darkest) ~ 238 (lightest)
-- vim.cmd("colorscheme space-vim-dark");
-- kanagwa
-- Default options:
--require('kanagawa').setup({
--    undercurl = true,           -- enable undercurls
--    commentStyle = { italic = true },
--    functionStyle = {},
--    keywordStyle = { italic = true},
--    statementStyle = { bold = true },
--    typeStyle = {},
--    variablebuiltinStyle = { italic = true},
--    specialReturn = true,       -- special highlight for the return keyword
--    specialException = true,    -- special highlight for exception handling keywords
--    transparent = false,        -- do not set background color
--    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
--    globalStatus = false,       -- adjust window separators highlight for laststatus=3
--    colors = {},
--    overrides = {},
--})

--vim.cmd("colorscheme kanagawa")

-- edge
--vim.g.edge_style = 'aura' -- neon, aura
--vim.g.edge_better_performance = 1
--vim.cmd("colorscheme edge")

-- github
-- vim.cmd("colorscheme github_dark_default")

-- oxocarbon
-- vim.cmd("colorscheme oxocarbon-lua")

-- vim.cmd("set background=dark")
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
require("indent_blankline").setup {
    space_char_blankline = " ",
}
