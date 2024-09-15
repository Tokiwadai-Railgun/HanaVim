# Welcome to 花
花 is a Vim configuration made for some laguages like Python, JavaScript, Typescript, C and Rust. 


# Plugins / Features 
* Telescope to easly search
* Autocomplete using ``nvim-cmp`` (and so ``mason.nvim`` & ``mason.lspconfig``)
* Lazygit with ``lazygit-nvim``
* FileTree using ``nvim-tree``
* ``Which-key`` to never forget keymaps
* Dashboard using ``nvim-dashboard``

# Folder Architecture
The configuration is split between multiple folders under the "Lua folder". Keep in mind that some config also are in init.lua but they are minor / general configurations (system clipboard for example)
```
|____init.lua
|____lua 
| |____config - Dedicated to configuration of vim.opts and plugins
| | |____keymaps.lua - All keymaps, end of file is dedicated to which-keys
| | |____editor.lua
| | |____utils.lua
| | |____lazy.lua - Dedicated to lazyvim configuration, not used for general purpose
| |____plugins - All lazy.nvim pluins import
| | |____editor.lua - Plugins related to the editor (cmp, lsp ...)
| | |____utils.lua - more general plugins (dashboard, colorscheme, which-keys ...)
|____lazy-lock.json
|____README.md

```

And Catppuccin as theme
# Features to be added
* [ ] Debugger (for C, Java, Rust)

