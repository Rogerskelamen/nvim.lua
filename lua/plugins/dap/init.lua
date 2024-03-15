return {
  "mfussenegger/nvim-dap",
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

