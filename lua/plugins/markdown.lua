return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  dependencies = "dhruvasagar/vim-table-mode",

  config = function()
    local g = vim.g

    -- Markdown Preview --
    -- set to 1, nvim will open the preview window after entering the markdown buffer
    g.mkdp_auto_start = 0
    -- set to 1, the nvim will auto close current preview window when change
    g.mkdp_auto_close = 0
    -- set to 1, the MarkdownPreview command can be use for all files,
    -- by default it can be use in markdown file
    g.mkdp_command_for_global = 0

    -- Vim Table Mode
    vim.cmd [[
      function! s:isAtStartOfLine(mapping)
      let text_before_cursor = getline('.')[0 : col('.')-1]
      let mapping_pattern = '\V' . escape(a:mapping, '\')
      let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
      return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
      endfunction

      inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
      inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'
    ]]
  end
}
