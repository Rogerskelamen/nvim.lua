return {
  "windwp/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre" },

  config = function()
    local status_ok, autotag = pcall(require, "nvim-ts-autotag")
    if not status_ok then
      vim.notify("Can't load nvim-ts-autotag, something wrong.")
      return
    end

    autotag.setup {
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = true
          },
        }
      }
    }
  end
}
