return {
  "voldikss/vim-translator",
  keys = {
    { mode = {"n", "x"}, "<leader>t", "<cmd>TranslateW<CR>", noremap = true, silent = true }
  },

  config = function()
    local g = vim.g
    g.translator_target_lang = "zh"
    g.translator_default_engines = {
      "google",
      -- "bing",
      -- "youdao",
      "haici"
    }
  end
}
