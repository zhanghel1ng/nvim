local M = {}
function M.config()
    require 'nvim-treesitter.configs'.setup {
        autotag = {
            enable = true,
        }
    }
end
return M
