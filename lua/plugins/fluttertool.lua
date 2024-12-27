return {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = "nvim-lua/plenary.nvim",

  config = function()
    local status_ok, flutter_tools = pcall(require, "flutter-tools")
    if not status_ok then
      return
    end

    -- Load telescope extension
    local telescope_status_ok, telescope = pcall(require, "telescope")
    if not telescope_status_ok then
      return
    end
    telescope.load_extension "flutter"

    flutter_tools.setup {
      ui = {
        -- the border type to use for all floating windows, the same options/formats
        -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
        border = "rounded",
        -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
        -- please note that this option is eventually going to be deprecated and users will need to
        -- depend on plugins like `nvim-notify` instead.
        notification_style = "plugin"
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities, -- e.g. lsp_status capabilities
        --- OR you can specify a function to deactivate or change or control how the config is created
        -- capabilities = function(config)
        --   config.specificThingIDontWant = false
        --   return config
        -- end,
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          -- analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
          renameFilesWithClasses = "prompt", -- "always"
          enableSnippets = true,
        }
      },
    };
  end
}
