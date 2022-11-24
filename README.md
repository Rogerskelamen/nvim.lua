# My Neovim in Lua version

> It's time to take neovim to the moon :)

<img width=600 src="https://user-images.githubusercontent.com/58795886/202449799-26c6d0f2-6ed4-4332-b493-cb9ef315ef2f.gif" />

<a href="https://music.163.com/#/song?id=632452" target="_blank">BGM if you wish.</a>

*if you prefer to use vimscript to configure your neovim, I recommend you to use [my previous neovim configuration in vimL](https://github.com/Rogerskelamen/nvim)*

> TODO: compose dap.nvim with mason.nvim

## Usage

Get into `lua/user/plugins.lua` using neovim and write buffer, the packer will do the rest of it. Easy-peasy!

## LSP

### Add a LSP

Cause I use [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) for my lspconfig management, you should notice that mason.nvim package names are not paired with lspconfig server names in the APIs. There is a [manual](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md) for all the mappings.

For example, if you want to install `vue-language-server` using mason.nvim, you should add `volar` instead in `servers` at `user/lsp/mason.lua`

### Configuration

If you want to configure the behavior of your lsp, please see this [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md), or you can type `:h lspconfig-all`.

Take pyright for example, you should find 'pyright' in the [manual](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md), on that pyright section, you find there a repo on first line, click it and it will lead you to the [pyright official repo](https://github.com/microsoft/pyright). In that repo, you can find [a manual about how to set pyright](https://github.com/microsoft/pyright/blob/main/docs/settings.md), then you just follow the manual to do your preferred configuration.
