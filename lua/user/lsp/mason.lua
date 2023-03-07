-- lsp to ensure installed
local servers = {
  "lua_ls",
  "vimls",
  "html",
  "cssls",
  "tsserver",
  "volar",
  "tailwindcss",
  "clangd",
  "pyright",
  "gopls",
  "bashls",
  "jsonls",
  "yamlls",
}

-- mason settings
local settings = {
  ui = {
    -- Whether to automatically check for new versions when
    -- opening the :Mason window.
    check_outdated_packages_on_open = true,
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  -- It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with package installations.
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

local status_mason_ok, mason = pcall(require, "mason")
if not status_mason_ok then
  return
end
mason.setup(settings)

-- Auto install lsp by mason-lspconfig
local status_mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_lsp_ok then
  return
end
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    -- import functions
    on_attach = require("user.lsp.handlers").on_attach, -- on_attach hook function
    capabilities = require("user.lsp.handlers").capabilities, -- cooperate with cmp_nvim_lsp
  }

  server = vim.split(server, "@")[1]

  -- user settings for lsp
  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end

