-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

    -- startup time optimise
    use 'dstein64/vim-startuptime'
	use 'lewis6991/impatient.nvim'
	use 'nathom/filetype.nvim'

    -- buffer
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'moll/vim-bbye' -- for more sensible delete buffer cmd
    
	-- themes (disabled other themes to optimize startup time)
	use 'sainnhe/sonokai'
        use 'jacoborus/tender.vim'

        -- file tree
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        -- status line

        use {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            requires = {
                'nvim-lua/plenary.nvim'
            }
        }
        -- floating terminal
        use 'akinsho/toggleterm.nvim'
        
        -- indent guide
        use 'lukas-reineke/indent-blankline.nvim'

        -- nvim treesitter
        use 'nvim-treesitter/nvim-treesitter'

        -- git
        use {
            'lewis6991/gitsigns.nvim',
            tag = 'release',
        }
        -- english grammar check
        use 'rhysd/vim-grammarous'

        -- status line
        use {
            'nvim-lualine/lualine.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }
end)
