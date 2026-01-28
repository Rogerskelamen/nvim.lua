return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPost",

  opts = {
    filetypes = {
      "html",
      "css",
      "less",
      "sass",
      "scss",
      "javascript",
      "typescript",
      "vue",
    },
    user_commands = { "ColorizerToggle" },
    user_default_options = {
      names = true, -- "Name" codes like Cyan or cyan
      names_opts = { -- options for mutating/filtering names.
        lowercase = true, -- name:lower(), highlight `blue` and `red`
        camelcase = false, -- name, highlight `Blue` and `Red`
        uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
        strip_digits = false, -- ignore names with digits,
        -- highlight `blue` and `red`, but not `blue3` and `red4`
      },

      RGB = true, -- #RGB hex codes
      RGBA = true, -- #RGBA hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      AARRGGBB = false, -- 0xAARRGGBB hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      oklch_fn = false, -- CSS oklch() function
      css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      tailwind = true, -- boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
      tailwind_opts = { -- Options for highlighting tailwind names
        update_names = false, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
      },
      -- parsers can contain values used in `user_default_options`
      sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
      xterm = false, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
      mode = "virtualtext", -- Available modes for `mode`: foreground, background,  virtualtext
      -- parsers can contain values used in |user_default_options|
      virtualtext = "■",
      -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
      virtualtext_inline = false,
      -- Virtualtext highlight mode: 'background'|'foreground'
      virtualtext_mode = "foreground",
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false,
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
  }
}
