return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true } },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true } },
    { "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true } },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true } },
    { "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true } },
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jayp0521/mason-nvim-dap.nvim", -- pair with mason
    "nvim-telescope/telescope-dap.nvim", -- pair with telescope
  },

  config = function()
    local status_ok, _ = pcall(require, "dap")
    if not status_ok then
      return
    end

    require "plugins.dap.set"
    require "plugins.dap.dapui"
  end
}

