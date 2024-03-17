return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "markdown",
      "c",
      "cpp",
      "make",
      "python",
      "html",
      "css",
      "javascript",
      "json",
      "vue",
      "scala",
      "go",
      "dart",
      "yaml",
      "xml",
    },
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = {
        "html",
        "css",
        "yaml",
      }
    },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "xml",
        "javascript",
        "typescript",
        "vue",
        "jsx",
        "tsx",
        "javascriptreact",
        "typescriptreact",
        "rescript",
        "php",
        "markdown",
      },
    },
  }
}
