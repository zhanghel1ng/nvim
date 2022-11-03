local M = {}
function M.config()
    require('dapui').setup()
    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        vim.api.nvim_command("DapVirtualTextEnable")
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
    dap.listeners.before.disconnect["dapui_config"] = function ()
        vim.api.nvim_command("DapVirtualTextDisable")
        dapui.close()
    end
    require("nvim-dap-virtual-text").setup {
        commented = true,
    }
end

return M
