return {
  "L3MON4D3/LuaSnip", -- snippet engine
  version = "v2.*",
  build = "make install_jsregexp",
  event = "InsertEnter",

  dependencies = {
    {
      "rafamadriz/friendly-snippets", -- a bunch of snippets to use
      config = function ()
        -- lazy load friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load({
          exclude = { "html" }
        })
        -- lazy load customized snippets
        require("luasnip.loaders.from_lua").lazy_load({paths = vim.fn.stdpath("config") .. "/lua/snips"})
      end
    }
  },

  config = function()
    local luasnip_status_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_status_ok then
      return
    end

    local snip_types_ok, types = pcall(require, "luasnip.util.types")
    if not snip_types_ok then
      return
    end

    -- snippet tips visualize
    luasnip.config.setup {
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = {{"●", "Orange"}}
          }
        },
        [types.insertNode] = {
          active = {
            virt_text = {{"●", "Green"}}
          }
        }
      },
    }

    -- stop snippets when you leave to normal mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("stop_snippets", { clear = true }),
      callback = function ()
        if ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
          and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
          and not luasnip.session.jump_active
        then
          luasnip.unlink_current()
        end
      end
    })
  end
}
