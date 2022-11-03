local M = {}
function M.config()
    local dap = require('dap')
    dap.adapters.go = {
        type = 'executable';
        command = 'node';
        args = { os.getenv('HOME') .. '/.vscode-server/extensions/golang.go-0.35.2/dist/debugAdapter.js' };
    }
    dap.configurations.go = {
        {
            type = 'go';
            name = 'Debug';
            request = 'launch';
            showLog = false;
            program = "${file}";
            dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
        },
    }
end

return M
