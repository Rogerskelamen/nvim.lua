-- dap to ensure installed
local servers = {
  "node2",
}

-- Auto install dap by mason-nvim-dap
local status_mason_dap_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not status_mason_dap_ok then
  return
end
mason_nvim_dap.setup {
  ensure_installed = servers,
  automatic_installation = true,
  automatic_setup = true,
  handlers = {
    function(config)
      -- all sources with no handler get passed here

      -- Keep original functionality
      require('mason-nvim-dap').default_setup(config)
    end,
  }
}

-- Load telescope extension
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end
telescope.load_extension "dap"
