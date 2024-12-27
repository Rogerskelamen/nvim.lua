return {
  "kdheepak/lazygit.nvim",
  keys = {
    { "<leader>g", "<cmd>LazyGitCurrentFile<CR>", { noremap = true, silent = true } }
  },

  config = function()
    local g = vim.g
    g.lazygit_floating_window_winblend = 0 -- transparency of floating window
    g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
    g.lazygit_floating_window_border_chars = {'╭', '╮', '╰', '╯'} -- customize lazygit popup window corner characters
    g.lazygit_floating_window_use_plenary = 0  -- use plenary.nvim to manage floating window if available
    g.lazygit_use_neovim_remote = 1  -- fallback to 0 if neovim-remote is not installed
  end
}
