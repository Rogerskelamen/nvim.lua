return {
  "mbbill/undotree",

  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

    if vim.fn.has("persistent_undo") then
      local undo_dir = vim.fn.stdpath("data") .. "\\undo"
      if vim.fn.empty(undo_dir) then
        os.execute("mkdir " .. undo_dir)
      end
      -- cache all the file edit history
      vim.opt.undofile = true
      vim.opt.undodir = undo_dir
    else
      return
    end

    -- Customize config
    local g = vim.g
    g.undotree_DiffAutoOpen = 1
    g.undotree_SetFocusWhenToggle = 1
    g.undotree_ShortIndicators = 1
    g.undotree_WindowLayout = 2
    g.undotree_DiffpanelHeight = 8
    g.undotree_SplitWidth = 24

    vim.cmd [[
    function g:Undotree_CustomMap()
      nmap <buffer> k <plug>UndotreeNextState
      nmap <buffer> j <plug>UndotreePreviousState
      nmap <buffer> K 5<plug>UndotreeNextState
      nmap <buffer> J 5<plug>UndotreePreviousState
    endfunc
    ]]
  end
}
