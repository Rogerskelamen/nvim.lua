local g = vim.g

-- everforest
g.everforest_cursor = "green"
g.everforest_enable_italic = 1 -- make keyword also italic
g.everforest_transparent_background = 1
g.everforest_diagnostic_text_highlight = 1 -- highlight background of diagnostic text
g.everforest_current_word = "grey background"
g.everforest_better_performance = 1

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("custom_highlights_everforest", {}),
  pattern = "everforest",
  callback = function()
    local config = vim.fn["everforest#get_configuration"]()
    local palette = vim.fn["everforest#get_palette"](config.background, config.colors_override)
    local set_hl = vim.fn["everforest#highlight"]

    -- make Float Window to be transparent
    set_hl("NormalFloat", palette.none, palette.none)
    set_hl("FloatBorder", palette.none, palette.none)
  end
})
