local M = {}

function M.config()
    -- nvim-tree config
    require('nvim-tree').setup({
        disable_netrw        = true,
        hijack_netrw         = true,
        -- ignore_ft_on_setup   = {},
        auto_reload_on_write = true,
        open_on_tab          = false,
        hijack_cursor        = false,
        update_cwd           = false,
        diagnostics          = {
            enable = false,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            }
        },
        update_focused_file  = {
            enable      = true,
            update_cwd  = true,
            ignore_list = {}
        },
        system_open          = {
            cmd  = nil,
            args = {}
        },
        filters              = {
            git_ignored = true,
            dotfiles = false,
            custom = {
                "^\\.git"
            }
        },
        git                  = {
            enable = true,
            ignore = true,
            timeout = 500,
        },
        view                 = {
            width = 25,
            --			height = 30,
            side = 'left',
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        trash                = {
            cmd = "trash",
            require_confirm = true
        },
        actions              = {
            change_dir = {
                global = false,
            },
            open_file = {
                quit_on_open = false,
            }
        }
    })
    -- vim.cmd([[
    --    let g:nvim_tree_icons = {
    --        \ 'default': '',
    --        \ 'symlink': '',
    --        \ 'git': {
    --        \   'unstaged': "✗",
    --        \   'staged': "✓",
    --        \   'unmerged': "",
    --        \   'renamed': "➜",
    --        \   'untracked': "★",
    --        \   'deleted': "",
    --        \   'ignored': "◌"
    --        \   },
    --        \ 'folder': {
    --        \   'arrow_open': "",
    --        \   'arrow_closed': "",
    --        \   'default': "",
    --        \   'open': "",
    --        \   'empty': "",
    --        \   'empty_open': "",
    --        \   'symlink': "",
    --        \   'symlink_open': "",
    --        \   }
    --        \ }
    --    ]])
end

return M
