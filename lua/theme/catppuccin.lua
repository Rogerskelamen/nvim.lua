require("catppuccin").setup {
  flavour = "frappe", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "frappe",
  },
  -- compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
  transparent_background = true,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
};
