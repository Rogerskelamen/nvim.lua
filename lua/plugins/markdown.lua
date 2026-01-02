return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  dependencies = {
    "dhruvasagar/vim-table-mode",
    "MeanderingProgrammer/render-markdown.nvim",
  },

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

    -- opts for render-markdown.nvim
    local render_opt = {
      sign = { enabled = false }, -- turn off the sign displayed in column
      completions = {
        lsp = { enabled = true },
      },
      code = {
        width = 'block',
        min_width = 60,
        -- borders
        border = 'then',
        left_pad = 1,
        right_pad = 1,
      },
      heading = {
        enabled = false,
        icons = { ' 󰎤 ', ' 󰎧 ', ' 󰎪 ', ' 󰎭 ', ' 󰎱 ', ' 󰎳 ' },
        position = 'inline',
        render_modes = true, -- keep rendering while inserting
      },
      checkbox = {
        unchecked = {
          icon = '󰄱',
          highlight = 'RenderMarkdownCodeFallback',
          scope_highlight = 'RenderMarkdownCodeFallback',
        },
        checked = {
          icon = '󰄵',
          highlight = 'RenderMarkdownUnchecked',
          scope_highlight = 'RenderMarkdownUnchecked',
        },
        custom = {
          question = { raw = '[?]', rendered = '', highlight = 'RenderMarkdownError', scope_highlight = 'RenderMarkdownError' },
          todo = { raw = '[>]', rendered = '󰦖', highlight = 'RenderMarkdownInfo', scope_highlight = 'RenderMarkdownInfo' },
          canceled = { raw = '[-]', rendered = '', highlight = 'RenderMarkdownCodeFallback', scope_highlight = '@text.strike' },
          important = { raw = '[!]', rendered = '', highlight = 'RenderMarkdownWarn', scope_highlight = 'RenderMarkdownWarn' },
          favorite = { raw = '[~]', rendered = '', highlight = 'RenderMarkdownMath', scope_highlight = 'RenderMarkdownMath' },
        },
      },
      pipe_table = {
        alignment_indicator = '─',
        border = { '╭', '┬', '╮', '├', '┼', '┤', '╰', '┴', '╯', '│', '─' },
      },
      link = {
        wiki = { icon = ' ', highlight = 'RenderMarkdownWikiLink', scope_highlight = 'RenderMarkdownWikiLink' },
        image = ' ',
        custom = {
          vue    = { pattern = 'vuejs%.org',    icon = '󰡄 ' },
          rollup = { pattern = 'rollupjs%.org', icon = '󰯀 ' },
        },
        hyperlink = ' ',
      },
      -- anti_conceal = {
      --   disabled_modes = { 'n' },
      --   ignore = {
      --     bullet = true,
      --     head_background = true,
      --   }
      -- },
      -- win_options = { concealcursor = { rendered = 'nvc' } }, -- correct many mistaken displays of conceal text
      callout = {
        note      = { raw = '[!NOTE]',      rendered = '󰋽 Note',      highlight = 'RenderMarkdownInfo',    category = 'github'   },
        tip       = { raw = '[!TIP]',       rendered = '󰌶 Tip',       highlight = 'RenderMarkdownSuccess', category = 'github'   },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint',    category = 'github'   },
        warning   = { raw = '[!WARNING]',   rendered = '󰀪 Warning',   highlight = 'RenderMarkdownWarn',    category = 'github'   },
        caution   = { raw = '[!CAUTION]',   rendered = '󰳦 Caution',   highlight = 'RenderMarkdownError',   category = 'github'   },
        -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
        abstract  = { raw = '[!ABSTRACT]',  rendered = '󰨸 Abstract',  highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        summary   = { raw = '[!SUMMARY]',   rendered = '󰨸 Summary',   highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        tldr      = { raw = '[!TLDR]',      rendered = '󰨸 Tldr',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        info      = { raw = '[!INFO]',      rendered = '󰋽 Info',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        todo      = { raw = '[!TODO]',      rendered = '󰗡 Todo',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        hint      = { raw = '[!HINT]',      rendered = '󰌶 Hint',      highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        success   = { raw = '[!SUCCESS]',   rendered = '󰄬 Success',   highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        check     = { raw = '[!CHECK]',     rendered = '󰄬 Check',     highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        done      = { raw = '[!DONE]',      rendered = '󰄬 Done',      highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        question  = { raw = '[!QUESTION]',  rendered = '󰘥 Question',  highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        help      = { raw = '[!HELP]',      rendered = '󰘥 Help',      highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        faq       = { raw = '[!FAQ]',       rendered = '󰘥 Faq',       highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        failure   = { raw = '[!FAILURE]',   rendered = '󰅖 Failure',   highlight = 'RenderMarkdownError',   category = 'obsidian' },
        fail      = { raw = '[!FAIL]',      rendered = '󰅖 Fail',      highlight = 'RenderMarkdownError',   category = 'obsidian' },
        missing   = { raw = '[!MISSING]',   rendered = '󰅖 Missing',   highlight = 'RenderMarkdownError',   category = 'obsidian' },
        danger    = { raw = '[!DANGER]',    rendered = '󱐌 Danger',    highlight = 'RenderMarkdownError',   category = 'obsidian' },
        error     = { raw = '[!ERROR]',     rendered = '󱐌 Error',     highlight = 'RenderMarkdownError',   category = 'obsidian' },
        bug       = { raw = '[!BUG]',       rendered = '󰨰 Bug',       highlight = 'RenderMarkdownError',   category = 'obsidian' },
        example   = { raw = '[!EXAMPLE]',   rendered = '󰉹 Example',   highlight = 'RenderMarkdownHint' ,   category = 'obsidian' },
        quote     = { raw = '[!QUOTE]',     rendered = '󱆨 Quote',     highlight = 'RenderMarkdownQuote',   category = 'obsidian' },
        cite      = { raw = '[!CITE]',      rendered = '󱆨 Cite',      highlight = 'RenderMarkdownQuote',   category = 'obsidian' },
      },
      overrides = {
        buftype = {
          -- always render in hover popup
          nofile = {
            anti_conceal = {
              enabled = false
            }
          }
        }
      }
    }

    local status_ok, render_md = pcall(require, 'render-markdown')
    if not status_ok then
      return
    end

    render_md.setup(render_opt)
  end
}
