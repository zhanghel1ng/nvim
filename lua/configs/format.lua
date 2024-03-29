local M = {}
function M.config()
    -- Utilities for creating configurations
    local util = require("formatter.util")
    local filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
                -- Supports conditional formatting
                if util.get_current_buffer_file_name() == "special.lua" then
                    return nil
                end

                -- Full specification of configurations is down below and in Vim help
                -- files
                return {
                    exe = "stylua",
                    args = {
                        "--search-parent-directories",
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                        "--",
                        "-",
                    },
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }
            end,
        },
        -- ["javascript","json"] = {
        --
        -- },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace,
        },
    }
    local ft_names = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "vue",
        "css",
        "json",
        "xml",
    }
    for _, ft_name in ipairs(ft_names) do
        filetype[ft_name] = {
            require("formatter.filetypes." .. ft_name).prettier,
        }
    end
    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = filetype,
    })
end

return M
