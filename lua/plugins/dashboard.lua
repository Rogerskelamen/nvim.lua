local utils = require("utils")

local preview_method = function()
  if not utils.__IS_WIN then
    return {
      command     = "lolcat -F 0.3",
      file_path   = vim.fn.stdpath("config") .. "/static/neovim.cat",
      file_height = 10,
      file_width  = 70,
    }
  end
  return {}
end

return {
  "nvimdev/dashboard-nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VimEnter",

  opts = {
    theme = "doom",
    preview = preview_method(),
    config = {
      week_header = {
        enable = utils.__IS_WIN,
      },
      vertical_center = true,
      center = {
        {
          icon    = " ",
          icon_hl = "Title",
          desc    = "Recently opened files       ",
          desc_hl = "String",
          key     = "h",
          keymap  = "SPC f h",
          key_hl  = "Number",
          action  = "Telescope oldfiles"
        },
        {
          icon    = "󰈞 ",
          icon_hl = "Title",
          desc    = "Find File                   ",
          desc_hl = "String",
          key     = "f",
          keymap  = "SPC f f",
          key_hl  = "Number",
          action  = "Telescope find_files"
        },
        {
          icon    = " ",
          icon_hl = "Title",
          desc    = "New  File                   ",
          desc_hl = "String",
          key     = "i",
          key_hl  = "Number",
          action  = "enew | startinsert"
        },
        {
          icon    = " ",
          icon_hl = "Title",
          desc    = "Open personal dotfiles      ",
          desc_hl = "String",
          key     = "d",
          key_hl  = "Number",
          action  = "e $MYVIMRC | NvimTreeFindFile"
        },
        {
          icon    = "󰏕 ",
          icon_hl = "Title",
          desc    = "Update plugins              ",
          desc_hl = "String",
          key     = "u",
          key_hl  = "Number",
          action  = "Lazy update"
        },
        {
          icon    = " ",
          icon_hl = "Title",
          desc    = "Startup time analysis       ",
          desc_hl = "String",
          key     = "s",
          key_hl  = "Number",
          action  = "Lazy profile"
        },
      },
    },
  }
}
