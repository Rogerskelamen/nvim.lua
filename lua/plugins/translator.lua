return {
  "voldikss/vim-translator",

  config = function()
    vim.keymap.set({"n", "x"}, "<leader>t", ":TranslateW<CR>", { noremap = true, silent = true })

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
