local M = {}
function M.config()
    -- nvim-treesitter config
    require 'nvim-treesitter.configs'.setup {
        -- ensure_installed = "maintained", -- for installing all maintained parsers
        ensure_installed = { "css","html","c", "rust", "lua", "go", "vue", "javascript" }, -- for installing specific parsers
    }
end

return M
