local dir_nvim = vim.fn.stdpath "config"

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local status_ok_ui, dapui = pcall(require, "dapui")
if not status_ok_ui then
  return
end


-- Javascript for Node --
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {dir_nvim .. '/dap/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
};
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
};

-- Dap UI --
dapui.setup {

}
