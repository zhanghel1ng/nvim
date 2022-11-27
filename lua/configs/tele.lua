local M = {}
function M.config()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    local telescope = require("telescope")

    telescope.setup {
        defaults = {
            mappings = {
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
            },
            layout_confit = {
                horizontal = {
                    preview_cutoff = 100,
                    preview_width = 0.6
                }
            },
            path_display = { "smart" }
        },
        extensions = {
            file_browser = {
                theme = "dropdown",
                -- disables netrw and use telescope-file-browser in its place
                -- hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        -- your custom insert mode mappings
                    },
                    ["n"] = {
                        -- your custom normal mode mappings
                    },
                },
            },
        },

    }
end

return M
