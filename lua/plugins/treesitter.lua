return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

    opts = {
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = {
          "html",
          "css",
          "xml",
          "yaml",
        }
      },
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
        group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
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
            vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
          end
        end,
      })
    end
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      select = {
        enable = true,
        lookahead = true,
        keys = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          -- You can also use captures from other query groups like `locals.scm`
          ["as"] = { query = "@local.scope", query_group = "locals"},
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        -- extention to create buffer-local keymaps
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
    config = function(_, opts)
      local TS = require("nvim-treesitter-textobjects")
      TS.setup(opts)

      local function attach(buf)
        local ft = vim.bo[buf].filetype
        local installed = require("nvim-treesitter").get_installed()
        local lang = vim.treesitter.language.get_lang(ft)

        if not (vim.tbl_get(opts, "move", "enable") and vim.tbl_contains(installed, lang)) then
          return
        end

        local select = vim.tbl_get(opts, "select", "keys") or {}
        ---@type table<string, table<string, string>>
        local moves = vim.tbl_get(opts, "move", "keys") or {}

        for key, query in pairs(select) do
          local query_group = "textobjects"
          if type(query) == "table" then
            query = query.query
            query_group = query.query_group
          end
          vim.keymap.set({ "x", "o" }, key, function()
            require("nvim-treesitter-textobjects.select").select_textobject(query, query_group)
          end, {
            buffer = buf,
            silent = true,
          })
        end

        for method, keymaps in pairs(moves) do
          for key, query in pairs(keymaps) do
            local queries = type(query) == "table" and query or { query }
            local parts = {}
            for _, q in ipairs(queries) do
              local part = q:gsub("@", ""):gsub("%..*", "")
              part = part:sub(1, 1):upper() .. part:sub(2)
              table.insert(parts, part)
            end
            local desc = table.concat(parts, " or ")
            desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
            desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")
            if not (vim.wo.diff and key:find("[cC]")) then
              vim.keymap.set({ "n", "x", "o" }, key, function()
                require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
              end, {
                buffer = buf,
                desc = desc,
                silent = true,
              })
            end
          end
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter_textobjects", { clear = true }),
        callback = function(ev)
          attach(ev.buf)
        end,
      })
      vim.tbl_map(attach, vim.api.nvim_list_bufs())
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre" },
    opts = {},
  }
}

