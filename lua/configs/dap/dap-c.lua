local M = {}

function M.config()
    local dap = require('dap')
    dap.adapters.codelldb = {
        -- host = '127.0.0.1',
        -- type = 'server',
        -- port = 12345,
        -- executable = {
        --     -- CHANGE THIS to your path!
        --     command = '/home/zhang/.vscode-server/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb',
        --     args = { "--port", "12345" },
        --
        --     -- On windows you may have to uncomment this:
        --     -- detached = false,
        -- }
        type = 'server',
        host = '127.0.0.1',
        port = 13000
    }
    dap.configurations.cpp = {
        {
            name = 'Launch',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
            args = {},

            -- 💀
            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            -- runInTerminal = false,
        },
    }

    -- If you want to use this for Rust and C, add something like this:

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M
