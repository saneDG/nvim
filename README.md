# nvim

install NeoVim

    brew install neovim

clone packer - https://github.com/wbthomason/packer.nvim#quickstart

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim

install formatters & linters (used in [lsp-config/null-ls.lua](https://github.com/saneDG/nvim/blob/main/lua/lsp-config/null-ls.lua))

    brew install eslint prettier stylua

optionally check that formatter is executable ie.: `:echo executable('eslint')` return `0` = not executable, `1` = executable.


Install plugins

    :PackerSync
    
    
[🗺 keymaps](https://github.com/saneDG/nvim/blob/main/lua/keymaps/init.lua)
