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
}

-- Load telescope extension
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end
telescope.load_extension "dap"

mason_nvim_dap.setup_handlers {
  function(source_name)
    -- all sources with no handler get passed here


    -- Keep original functionality of `automatic_setup = true`
    require('mason-nvim-dap.automatic_setup')(source_name)
  end,
}
