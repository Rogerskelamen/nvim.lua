return {
  {
    "sainnhe/everforest",
    lazy = true,
    config = function ()
      vim.api.nvim_create_autocmd('ColorScheme', {
        group = vim.api.nvim_create_augroup('custom_highlights_everforest', {}),
        pattern = 'everforest',
        callback = function()
          local config = vim.fn['everforest#get_configuration']()
          local palette = vim.fn['everforest#get_palette'](config.background, config.colors_override)
          local set_hl = vim.fn['everforest#highlight']

          -- make Float Window to be transparent
          set_hl('NormalFloat', palette.none, palette.none)
          set_hl('FloatBorder', palette.none, palette.none)
        end
      })
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true
  },
  {
    "folke/tokyonight.nvim",
    lazy = true
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true
  }
}
