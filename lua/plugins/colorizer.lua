local common_file_opts = {
  parsers = {
    hex       = { rgb = true, rrggbb = true, rrggbbaa = false },
    names     = { enable = false },
    rgb       = { enable = false },
    hsl       = { enable = false },
    css_color = { enable = true },
    tailwind  = false,
  }
}

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
      lua = common_file_opts,
      -- cmp_docs = { always_update = true },
    },
    user_commands = { "ColorizerToggle" },
    options = {
      parsers = {
        names = {
          enable = true, -- enable named colors (e.g. "Blue")
          lowercase = true, -- match lowercase names
          camelcase = false, -- match CamelCase names (e.g. "LightBlue")
          uppercase = false, -- match UPPERCASE names
          strip_digits = false, -- ignore names with trailing digits (e.g. "blue3")
          custom = false, -- custom name-to-hex mappings; table|function|false
          extra_word_chars = "-", -- extra chars treated as part of color name
        },
        hex = { default = true, aarrggbb = false },
        rgb = { enable = true }, -- rgb()/rgba() functions
        hsl = { enable = true }, -- hsl()/hsla() functions
        css_color = { enable = true }, -- color() function (srgb, display-p3, a98-rgb, etc.)
        tailwind = {
          enable = true, -- parse Tailwind color names
          update_names = true, -- feed LSP colors back into name parser (requires both enable + lsp.enable)
          lsp = true,
        },
        sass = {
          enable = false, -- parse Sass color variables
          parsers = { css = true }, -- parsers for resolving variable values
          variable_pattern = "^%$([%w_-]+)", -- Lua pattern for variable names
        },
        xterm = { enable = false }, -- xterm 256-color codes (#xNN, \e[38;5;NNNm)
        xcolor = { enable = false }, -- LaTeX xcolor expressions (e.g. red!30)
        hsluv = { enable = false }, -- hsluv()/hsluvu() functions
        css_var_rgb = { enable = false }, -- CSS vars with R,G,B (e.g. --color: 240,198,198)
        css_var = {
          enable = true, -- resolve var(--name) references to their defined color
          parsers = { css = true }, -- parsers for resolving variable values
        },
        custom = {}, -- list of custom parser definitions
      },
      display = {
        mode = "virtualtext",
        virtualtext = { position = "after" },
      },
      -- update color values even if buffer is not focused
      -- example use: cmp_menu, cmp_docs
      always_update = false,
    },
    -- all the sub-options of filetypes apply to buftypes
    buftypes = {},
  }
}
