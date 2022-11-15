local g = vim.g

-- everforest
g.everforest_cursor = "green"
g.everforest_transparent_background = 1 -- completely transparent
g.everforest_ui_contrast = "low"
g.everforest_diagnostic_text_highlight = 1
g.everforest_current_word = "grey background"
g.everforest_better_performance = 1

-- catppuccin
require("catppuccin").setup({
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
});

-- tokyonight --
require("tokyonight").setup({
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
});

-- material
require('material').setup({
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { --[[ italic = true ]] },
    strings = { --[[ bold = true ]] },
    keywords = { --[[ underline = true ]] },
    functions = { --[[ bold = true, undercurl = true ]] },
    variables = {},
    operators = {},
    types = {},
  },
  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    -- "dap",
    "dashboard",
    "gitsigns",
    -- "hop",
    -- "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    "nvim-cmp",
    -- "nvim-navic",
    "nvim-tree",
    "nvim-web-devicons",
    -- "sneak",
    "telescope",
    -- "trouble",
    -- "which-key",
  },
  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false -- Hide the end-of-buffer lines
  },
  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false -- Enable higher contrast text for darker style
  },
  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
  custom_colors = nil, -- If you want to everride the default colors, set this to a function
  custom_highlights = {}, -- Overwrite highlights with your own
})

-- Set colorsheme
local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
