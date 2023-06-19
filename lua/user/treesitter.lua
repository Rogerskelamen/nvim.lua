local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

local status_parser_ok, parser_list = pcall(require, "nvim-treesitter.parsers")
if not status_parser_ok then
  return
end

parser_list.list.xml = {
  install_info = {
    url = "https://github.com/Trivernis/tree-sitter-xml",
    files = { "src/parser.c" },
    generate_requires_npm = true,
    branch = "main",
  },
  filetype = "xml",
}

configs.setup {
  ensure_installed = {
    "lua",
    "vim",
    "help",
    "markdown",
    "c",
    "cpp",
    "make",
    "python",
    "html",
    "css",
    "javascript",
    "json",
    "vue",
    "go",
    "dart",
    "yaml",
    "xml",
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = {
      "html",
      "css",
      "yaml",
    }
  },
  rainbow = {
    enable = true,
    -- disalbe = {"html"}, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "xml",
      "javascript",
      "typescript",
      "vue",
      "jsx",
      "tsx",
      "javascriptreact",
      "typescriptreact",
      "rescript",
      "php",
      "markdown",
    },
  },
};
