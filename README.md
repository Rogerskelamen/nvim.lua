# My Neovim in Lua version

> It's time to take neovim to the moon :)

<img width=600 src="https://user-images.githubusercontent.com/58795886/210171006-c6fd2815-a5c2-45a6-8ad4-7d49db01f37c.gif" />

<a href="https://music.163.com/#/song?id=22796856" target="_blank">BGM if you wish.</a>

*If you prefer to use vimscript to configure your neovim, you could take a look at [my previous neovim configuration in vimL](https://github.com/Rogerskelamen/nvim).*

> TODO: setup for nvim-dap-ui

## 🚀 Usage

Just clone and rename this repo to your `$HOME/.config/nvim` and get into neovim, [lazy.nvim](https://github.com/folke/lazy.nvim) will handle the rest of it. 😄Easy-peasy!

Tips: You could enable/disable any module at `lua/control.lua` as you like.

## ⚡️ Requirements

### [nodejs](https://nodejs.org/en/)

[mason.nvim](https://github.com/williamboman/mason.nvim) uses `npm` to install packages like lsps and daps, so you'd better have node installed.

### [ripgrep](https://github.com/BurntSushi/ripgrep)

For usage of [telescope](https://github.com/nvim-telescope/telescope.nvim), `ripgrep` is required for `live_grep` and `grep_string` and is the first priority for `find_files`.

### File manager

If you enable `fm` module, you should install a file manager. Here's my default choices(or you could just replace to your favorite):

- [ranger](https://github.com/ranger/ranger) for Unix-like

- [yazi](https://github.com/sxyazi/yazi) for Windows

### [pynvim](https://github.com/neovim/pynvim)

It's a python module for python client to communicate with NeoVim(*also a checkhealth node*). You'd better install it by executing `pip install pynvim`, because some plugins may depend on it.

### [live-server](https://www.npmjs.com/package/live-server)

If you want to use [live-server nvim plugin](https://github.com/Rogerskelamen/live-server.nvim) to help you with html live displaying, you better globally install `live-server` by executing `npm i live-server -g`.

### [compiledb](https://github.com/nickdiego/compiledb)

Neccessary if you want to autogenerate [`compile_commands.json`](https://clangd.llvm.org/installation.html#project-setup) in GNU make/cmake project(*paired with [clangd](https://clangd.llvm.org/)*), which means the tool is similar to [Bear](https://github.com/rizsotto/Bear). You may find that I add a `run_file` function to `make` filetype, so you are able to generate json file by pressing <kbd>r</kbd> if you really need it.(*If you never write C program, then just leave it*)

## 🛠️ LSP

### Add a LSP

Cause I use [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim) for my lspconfig management, you should notice that mason.nvim package names are not paired with lspconfig server names in the APIs. You should go `:h lspconfig-all` to check all the mappings. *As for dap server name mappings, please see [this](https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua).*

For example, if you want to install `vue-language-server` through mason.nvim, you should add `volar` instead in `servers` at `user/lsp/mason.lua`.

### Configuration

If you want to configure the behavior of your lsp, please see this [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md), or you can type `:h lspconfig-all`.

Take pyright for example, you should find 'pyright' in the [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md), on that pyright section, you find there a repo on first line, click it and it will lead you to the [pyright official repo](https://github.com/microsoft/pyright). In that repo, you can find [a manual about how to set pyright](https://github.com/microsoft/pyright/blob/main/docs/settings.md), then you just follow the manual to do your preferred configuration.

## 📜 Snippets

I use [LuaSnip](https://github.com/L3MON4D3/LuaSnip) to manage all snippets and their behaviors. Don't worry about its function for it works well with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp). Though the default snippets collection [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) holds enough useful snippets for most time, you might still want to add some by yourself.

### Configuration

I believe the [LuaSnip official document](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders) is well explained. And for my own preference, I make `lua/snip` as the default repo for custom snippets and load files in the `lua` way. So if you want to add a snippet, *python for example*, you could write snip in file `python.lua` by following the [examples](https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua#L190).

## 📋 Clipboard

Neovim does not support direct connection to the system clipboard, instead it depends on a provider to communicate with the system clipboard. For more details, press `:h provider-clipboard`.

Neovim default paste behavior in visual mode is keeping storing the word selected, which could be really annoying. I made a <kbd>p</kbd> keymap that everytime you paste content to a selected word, Neovim won't store it to register. So when you select a word in visual mode, just press <kbd>p</kbd> to paste and press <kbd>P</kbd> for line-tail word.

## 💡 Tips for Use

Sometimes we still could not remember some hot keys for functions like getting current character's hexadecimal value, so here is the list to lookup for if forget.

- `gO`

    Get a popup window for current help document.

- `ga`

    Get the decimal, hexadecimal, and octal value of current character under cursor.

- `:f` or `<C-g>`

    Print the file name of current buffer.

- `<C-]>`

    Jump to certain help document referred to current keyword under cursor.

- `q:`

    Open cmdline-window, where you can execute or edit history commands(*type `:h command-line-window` for more details*)

## 💻 About NeoVim Win64

**!! This compatible problem will not exist soon cause I'm merging win branch to main**

Look for Neovim configuration for Windows version? You may need to check out [the other branch of this repo](https://github.com/Rogerskelamen/nvim.lua/tree/win)

## LICENSE

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.html).
