local control = require("control")

if not control.metals.enabled then return {} end

return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local status_ok, metals = pcall(require, "metals")
    if not status_ok then
      return
    end

    local metals_config = metals.bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = {
        "akka.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl"
      },
    }

    metals_config.capabilities = require("plugins.lsp.handlers").capabilities
    metals_config.on_attach = require("plugins.lsp.handlers").on_attach

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        metals.initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
