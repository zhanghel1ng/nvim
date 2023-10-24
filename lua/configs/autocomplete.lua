local M = {}

function M.config()
    local mason_lsp = '/home/zhang/.local/share/nvim/mason/bin/'
    local lsp = require 'lspconfig'
    lsp.gopls.setup({
        single_file_support = true
    })

    lsp.racket_langserver.setup({
        cmd = {
            "xvfb-run",
            "racket",
            "-l", "racket-langserver"
        }
    })

    lsp.html.setup({
        cmd = { mason_lsp .. "vscode-html-language-server", "--stdio" },
    })
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require 'lspconfig'.cssls.setup {
        capabilities = capabilities,
    }

    require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                })

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
        end,
        cmd = { mason_lsp .. "lua-language-server" }
    }

    lsp.pyright.setup({ cmd = { mason_lsp .. "pyright-langserver", "--stdio" } })

    -- lsp.volar.setup {
    --     filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
    --
    -- }

    lsp.vuels.setup({
        cmd = { mason_lsp .. "vls" },
        filetypes = { 'vue' }
    })

    lsp.tsserver.setup({
        cmd = { mason_lsp .. "typescript-language-server", "--stdio" },
    })


    -- lsp.sumneko_lua.setup {}

    require('lspkind').init({
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,

        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',

        -- override preset symbols
        --
        -- default: {}
        -- symbol_map = {
        --     Text = "",
        --     Method = "",
        --     Function = "",
        --     Constructor = "",
        --     Field = "ﰠ",
        --     Variable = "",
        --     Class = "ﴯ",
        --     Interface = "",
        --     Module = "",
        --     Property = "ﰠ",
        --     Unit = "塞",
        --     Value = "",
        --     Enum = "",
        --     Keyword = "",
        --     Snippet = "",
        --     Color = "",
        --     File = "",
        --     Reference = "",
        --     Folder = "",
        --     EnumMember = "",
        --     Constant = "",
        --     Struct = "פּ",
        --     Event = "",
        --     Operator = "",
        --     TypeParameter = ""
        -- },
    })

    local lspkind = require('lspkind')
    -- Setup nvim-cmp.
    --
    local cmp = require 'cmp'
    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- luasnip
                require('luasnip').lsp_expand(args.body)
                -- vsnip
                -- vim.fn["vsnip#anonymous"](args.body)
                -- snippy
                -- require('snippy').expand_snippet(args.body)
                -- ultisnip
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- Accept currently selected item...
            -- Set `select` to `false` to only confirm explicitly selected items:
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, { { name = 'buffer' } }),
        formatting = {
            format = lspkind.cmp_format({
                with_text = true, -- do not show text alongside icons
                maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                before = function(entry, vim_item)
                    -- Source 显示提示来源
                    vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                    return vim_item
                end
            })
        },
    })

    -- You can also set special config for specific filetypes:
    --    cmp.setup.filetype('gitcommit', {
    --        sources = cmp.config.sources({
    --            { name = 'cmp_git' },
    --        }, {
    --            { name = 'buffer' },
    --        })
    --    })

    -- nvim-cmp for commands
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local luasnip = require("luasnip")

    cmp.setup({
        mapping = {

            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        -- ... Your other configuration ...
    })

    -- nvim-lspconfig config
    -- List of all pre-configured LSP servers:
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local servers = { 'clangd', 'rust_analyzer' }
    for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
            on_attach = on_attach
        }
    end
    -- local lsp = lsp
    -- lsp.clangd.setup{}
    -- lsp.rust_analyzer.setup{}
    -- lsp.sumneko_lua.setup{}

    local devicons = require('nvim-web-devicons')
    cmp.register_source('devicons', {
        complete = function(_, _, callback)
            local items = {}
            for _, icon in pairs(devicons.get_icons()) do
                table.insert(items, {
                    label = icon.icon .. '  ' .. icon.name,
                    insertText = icon.icon,
                    filterText = icon.name,
                })
            end
            callback({ items = items })
        end,
    })
    local saga = require 'lspsaga'

    -- use default config
    saga.setup({
        symbol_in_winbar = {
            in_custom = false,
            enable = false,
            separator = ' ',
            show_file = true,
            -- define how to customize filename, eg: %:., %
            -- if not set, use default value `%:t`
            -- more information see `vim.fn.expand` or `expand`
            -- ## only valid after set `show_file = true`
            file_formatter = "",
            click_support = false,
        },
        ui = {
            code_action = "󰌵",
        },
        devicon = true,
        outline = {
            auto_preview = false
        }
        -- diagnostic_header = { "🙀", "😿", "😾", "😺" },
    })

    local rt = require('rust-tools')

    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
        tools = {
            -- inlay_hints = {
            --     other_hints_prefix = " "
            -- }
        }
    })
    require('rust-tools').inlay_hints.enable()
    require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
    })

    -- lsp安装器
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    vim.lsp.set_log_level('warn')
    -- require('configs.lsp.go-lsp').config()
end

return M
