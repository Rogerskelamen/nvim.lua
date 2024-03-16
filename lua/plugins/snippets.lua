return {
  "L3MON4D3/LuaSnip", -- snippet engine
  dependencies = "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  config = function()
    local luasnip_status_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_status_ok then
      return
    end

    local snip_types_ok, types = pcall(require, "luasnip.util.types")
    if not snip_types_ok then
      return
    end

    local loader_status_ok, lua_loader = pcall(require, "luasnip.loaders.from_lua")
    if not loader_status_ok then
      return
    end

    -- lazy load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- load customized snippets
    lua_loader.load({paths = vim.fn.stdpath("config") .. "/lua/snips"})

    -- snippet tips visualize
    luasnip.config.setup {
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = {{"●", "GruvboxOrange"}}
          }
        },
        [types.insertNode] = {
          active = {
            virt_text = {{"●", "GruvboxBlue"}}
          }
        }
      },
    }

    function _G.leave_snippet()
      if
        ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
        and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not luasnip.session.jump_active
      then
        luasnip.unlink_current()
      end
    end

    -- stop snippets when you leave to normal mode
    vim.api.nvim_command [[
        autocmd ModeChanged * lua leave_snippet()
    ]]
  end
}
