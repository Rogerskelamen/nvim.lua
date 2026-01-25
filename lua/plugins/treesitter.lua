return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      folds = { enable = true },
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
        "typescript",
        "json",
        "vue",
        "rust",
        "yaml",
        "xml",
        -- "scala",
        -- "go",
        -- "cmake",
        -- "dart",
      }
    },

    config = function(_, opts)
      local TS = require("nvim-treesitter")

      local already_installed = TS.get_installed()

      local install = vim.iter(opts.ensure_installed)
        :filter(function(parser) return not vim.tbl_contains(already_installed, parser) end):totable()
      if #install > 0 then
        TS.install(install)
      end

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter",
        callback = function(event)
          local lang = vim.treesitter.language.get_lang(event.match)
          local bufnr = event.buf

          -- No parser is installed for this filetype
          if not vim.tbl_contains(opts.ensure_installed, lang) then
            return
          end

          local function enabled(feat)
            local f = opts[feat] or {}
            return f.enable ~= false
              and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
          end

          if enabled("highlight") then
            pcall(vim.treesitter.start, bufnr, lang)
            vim.bo[bufnr].syntax = "ON"
          end

          if enabled("indent") then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          if enabled("folds") then
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          end
        end,
      })
    end
  },

  {
    
  }
}

