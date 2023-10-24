-- packer.nvim
--
return require('lazy').setup({
    'wbthomason/packer.nvim',

    -- startup time optimise
    'dstein64/vim-startuptime',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        enabled = true,
        opts = {},
        -- stylua: ignore
    },
    -- buffer
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    'moll/vim-bbye', -- for more sensible delete buffer cmd,

    -- themes (disabled other themes to optimize startup time)
    'sainnhe/sonokai',
    'jacoborus/tender.vim',
    'tiagovla/tokyodark.nvim',
    'projekt0n/github-nvim-theme',
    'joshdick/onedark.vim',
    { 'catppuccin/nvim', name = 'catppuccin' },
    -- { 'sonph/onehalf', rtp = 'vim/' },
    'ahmedabdulrahman/aylin.vim',
    "rebelot/kanagawa.nvim",
    'NLKNguyen/papercolor-theme',
    'liuchengxu/space-vim-dark',
    'sainnhe/edge',
    'B4mbus/oxocarbon-lua.nvim',
    'Th3Whit3Wolf/one-nvim',
    'morhetz/gruvbox',
    'altercation/vim-colors-solarized',
    'tomasr/molokai',
    'rose-pine/neovim',
    'shaunsingh/nord.nvim',
    'xiyaowong/nvim-transparent',
    'dracula/vim',
    'sainnhe/everforest',
    'sainnhe/gruvbox-material',
    'tanvirtin/monokai.nvim',
    'overcache/NeoSolarized',
    {
        'svrana/neosolarized.nvim',
        dependencies = { 'tjdevries/colorbuddy.nvim' }
    },
    -- file tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        version = 'nightly'                -- optional, updated every week. (see issue #1193)
    },
    -- status line

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    --  { "nvim-telescope/telescope-file-browser.nvim" }
    -- floating terminal
    'akinsho/toggleterm.nvim',

    -- indent guide,
    --  'lukas-reineke/indent-blankline.nvim',

    -- nvim treesitter,
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-ts-autotag',
    -- git
    {
        'lewis6991/gitsigns.nvim',
    },
    -- english grammar check
    'rhysd/vim-grammarous',

    -- status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- lsp
    "neovim/nvim-lspconfig",
    'glepnir/lspsaga.nvim',
    'simrat39/rust-tools.nvim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'simrat39/symbols-outline.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'mfussenegger/nvim-jdtls',
    --  'ray-x/go.nvim',
    'mhartington/formatter.nvim',
    -- null-ls,
    'windwp/nvim-autopairs',
    'mg979/vim-visual-multi',
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    'tpope/vim-surround',
    -- Lua
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },
    -- lsp 包管理器
    "williamboman/mason.nvim",

    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },
    --  'ggandor/leap.nvim'
    -- Lua
    {
        'abecodes/tabout.nvim',
        -- wants = { 'nvim-treesitter' }, -- or require if not d so far
        -- after = { 'nvim-cmp' } -- if a completion plugin is using tabs load it before
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
})
