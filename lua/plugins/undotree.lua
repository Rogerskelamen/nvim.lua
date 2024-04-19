return {
  "mbbill/undotree",

  config = function()
    vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

    if vim.fn.has("persistent_undo") then
      local undo_dir = os.getenv("HOME") .. "/.cache/nvim/undo"
      if vim.fn.empty(undo_dir) then
        vim.cmd [[
        silent !mkdir -p $HOME/.cache/nvim/undo
        ]]
      end
      vim.cmd [[
      " cache all the file edit history
      set undofile
      set undodir=$HOME/.cache/nvim/undo,.
      ]]
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
