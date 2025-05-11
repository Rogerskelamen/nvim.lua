return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy" },
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    configs.setup {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "c",
        "cpp",
        "make",
        "cmake",
        "python",
        "html",
        "css",
        "javascript",
        "json",
        "vue",
        "scala",
        "rust",
        "go",
        "dart",
        "yaml",
        "xml",
      },
      sync_install = false,
      ignore_install = { "" }, -- List of parsers to ignore installing
      highlight = {
        enable = true, -- false will disable the whole extension
        -- Disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 300 * 1024 -- 300 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = {
          "html",
          "css",
          "xml",
          "yaml",
        }
      },
    };
  end
}

