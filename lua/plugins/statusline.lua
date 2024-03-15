return {
  {
    "beauwilliams/statusline.lua",
    -- lazy = true,
    config = function()
      local status_ok, statusline = pcall(require, "statusline")
      if not status_ok then
        return
      end

      -- statusline.tabline = false
      statusline.lsp_diagnostics = true
    end
  },
  {
    "feline-nvim/feline.nvim",
    lazy = true
  }
}
