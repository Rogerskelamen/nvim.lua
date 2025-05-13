return {
  "nvim-telescope/telescope.nvim",

  cmd = "Telescope",
  keys = {
    { "<leader>ff",
      function()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        local cwd = (git_root ~= "" and git_root) or vim.lsp.buf.list_workspace_folders()[1]
        require('telescope.builtin').find_files { cwd = cwd }
      end,
      noremap = true, silent = true },
    { "<leader>fh", "<cmd>Telescope oldfiles<CR>",            noremap = true, silent = true },
    { "<leader>fw",
      function()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        local cwd = (git_root ~= "" and git_root) or vim.lsp.buf.list_workspace_folders()[1]
        require('telescope.builtin').live_grep { cwd = cwd }
      end,
      noremap = true, silent = true },
    { "<leader>fd", "<cmd>Telescope dap commands<CR>",        noremap = true, silent = true },
    { "<leader>b",  "<cmd>Telescope buffers<CR>",             noremap = true, silent = true },
    { "gd",         "<cmd>Telescope lsp_definitions<CR>",     noremap = true, silent = true },
    { "gr",         "<cmd>Telescope lsp_references<CR>",      noremap = true, silent = true },
    { "gi",         "<cmd>Telescope lsp_implementations<CR>", noremap = true, silent = true },
    { "z=",         "<cmd>Telescope spell_suggest<CR>",       noremap = true, silent = true },
  },
  dependencies = "nvim-lua/plenary.nvim",

  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      vim.notify("Can't load telescope!")
      return
    end

    -- if want to add a extensions: e.g.
    -- telescope.load_extension "extension_name"

    local status_actions_ok, actions = pcall(require, "telescope.actions")
    if not status_actions_ok then
      return
    end

    telescope.setup {
      defaults = {

        prompt_prefix = "  ",
        selection_caret = "  ",
        path_display = { "smart" },

        color_devicons = true,
        scroll_strategy = 'cycle',
        sorting_strategy = 'ascending',
        -- file_ignore_patterns = ignore_these,
        layout_strategy = 'flex',
        layout_config = {
          prompt_position = 'bottom',
          horizontal = {
            mirror = false,
            preview_cutoff = 80,
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 110,
          },
          height = 0.94,
          width = 0.86,
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-/>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },
      },
      -- pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
      -- },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      },
    }
  end
}
