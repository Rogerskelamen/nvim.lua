# 🌕 My Neovim in Lua version

> It's time to take neovim to the moon :)

<img width=600 src="https://user-images.githubusercontent.com/58795886/210171006-c6fd2815-a5c2-45a6-8ad4-7d49db01f37c.gif" />

<a href="https://music.163.com/#/song?id=632452" target="_blank">BGM if you wish.</a>

*If you prefer to use vimscript to configure your neovim, I recommend you to use [my previous neovim configuration in vimL](https://github.com/Rogerskelamen/nvim).*

> TODO: setup for nvim-dap-ui

## 🚀 Usage

Get into `lua/user/plugins.lua` using neovim and write buffer, the packer will do the rest of it. Easy-peasy!

## ⚡️ Requirements

### [nodejs](https://nodejs.org/en/)

[mason.nvim](https://github.com/williamboman/mason.nvim) uses `npm` to install packages like lsps and daps, so you'd better have node installed.

### [ripgrep](https://github.com/BurntSushi/ripgrep)

For usage of [telescope](https://github.com/nvim-telescope/telescope.nvim), `ripgrep` is required for `live_grep` and `grep_string` and is the first priority for `find_files`.

### [ranger](https://github.com/ranger/ranger)

Necessary if you want to use [rnvimr](https://github.com/kevinhwang91/rnvimr), which makes it easy for you to use ranger in your neovim. It's really great!

### [live-server](https://www.npmjs.com/package/live-server)

If you want to use [live-server vim plugin](https://github.com/manzeloth/live-server) to help you with html live displaying, you better globally install `live-server` by executing `npm i live-server -g`.

## LSP

### Add a LSP

Cause I use [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) for my lspconfig management, you should notice that mason.nvim package names are not paired with lspconfig server names in the APIs. There is a [manual](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md) for all the mappings. *As for dap server name mappings, please see [this](https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua).*

For example, if you want to install `vue-language-server` through mason.nvim, you should add `volar` instead in `servers` at `user/lsp/mason.lua`.

### Configuration

If you want to configure the behavior of your lsp, please see this [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md), or you can type `:h lspconfig-all`.

Take pyright for example, you should find 'pyright' in the [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md), on that pyright section, you find there a repo on first line, click it and it will lead you to the [pyright official repo](https://github.com/microsoft/pyright). In that repo, you can find [a manual about how to set pyright](https://github.com/microsoft/pyright/blob/main/docs/settings.md), then you just follow the manual to do your preferred configuration.

## Clipboard

Neovim does not support direct connection to the system clipboard, instead it depends on a provider to communicate with the system clipboard. For more details, press `:h provider-clipboard`.

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

## LICENSE

[GPLv3](https://www.gnu.org/licenses/gpl-3.0.html).
