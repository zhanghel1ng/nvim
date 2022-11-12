-- Configure lsp information display style
local M = {}

M.config = function()
    -- replace the lsp info symbol
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }
    vim.fn.sign_define('DapBreakpoint',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition',
        { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointRejected',
        { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint',
        numhl = 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    -- set the style of lsp info
    local config = {
        -- disable virtual text
        -- the message show after the current line.
        -- virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    -- set the popup window border
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --   border = "rounded",
    -- })
    --
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    --   border = "rounded",
    -- })
    vim.api.nvim_set_hl(0, 'LspSagaLightBulb', { fg = '#FFD700' })
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939' })
    -- vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#993939', bg = '', ctermbg = 0 })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = '', ctermbg = 0 })
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#98c379', bg = '', ctermbg = 0 })
end

return M
