-- lsp to ensure installed
local servers = {
  "lua_ls",
  "vimls",
  "html",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "vue_ls",
  "clangd",
  "cmake",
  "pyright",
  "rust_analyzer",
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
    border = "rounded",
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

local opts = {}

for _, server in pairs(servers) do
  opts = {
    -- import functions
    on_attach = require("plugins.lsp.handlers").on_attach, -- on_attach hook function
    capabilities = require("plugins.lsp.handlers").capabilities, -- cooperate with cmp_nvim_lsp
  }

  server = vim.split(server, "@")[1]

  vim.lsp.config(server, opts) -- user settings for lsp
end
