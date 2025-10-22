return {
  "jbyuki/venn.nvim",
  keys = {
    { "tv", ":lua toggle_venn()<CR>", noremap = true }
  },
  cmd = { "VBox", "VBoxD", "VBoxH" },

  config = function()
    -- venn.nvim: enable or disable keymappings
    function _G.toggle_venn()
      local venn_enabled = vim.inspect(vim.b.venn_enabled)
      if venn_enabled == "nil" then
        vim.notify("venn enabled!")
        vim.b.venn_enabled = true
        vim.opt_local.virtualedit = "all"
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "<C-j>", "<C-v>j:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-k>", "<C-v>k:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-l>", "<C-v>l:VBox<CR>", { noremap = true })
        vim.api.nvim_buf_set_keymap(0, "n", "<C-h>", "<C-v>h:VBox<CR>", { noremap = true })
        -- draw a box by pressing "b" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "b", ":VBox<CR>", { noremap = true })
      else
        vim.notify("venn disabled!")
        vim.opt_local.virtualedit = ""
        vim.api.nvim_buf_del_keymap(0, "n", "<C-j>")
        vim.api.nvim_buf_del_keymap(0, "n", "<C-k>")
        vim.api.nvim_buf_del_keymap(0, "n", "<C-l>")
        vim.api.nvim_buf_del_keymap(0, "n", "<C-h>")
        vim.api.nvim_buf_del_keymap(0, "v", "b")
        vim.b.venn_enabled = nil
      end
    end

  end
}
