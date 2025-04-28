# neovim config

install neovim

    brew install neovim

clone repo to .config/nvim

    git clone git@github.com:saneDG/nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim


use neovim

    nvim

--- 

plugins: https://github.com/saneDG/nvim/tree/main/lua/plugins

configs: https://github.com/saneDG/nvim/blob/main/lua/settings.lua

keymaps: https://github.com/saneDG/nvim/blob/main/lua/keymaps.lua

--- 

package manager: https://github.com/folke/lazy.nvim

---

Personal notes:

Banger guide: https://thevaluable.dev/vim-commands-beginner/

Basic keystrokes to move quickly on a line in NORMAL mode:

    w - move forward to the next word. A word - by default - is a sequence containing letters, digits, or underscores.
    b - move back your cursor to the previous word
    0 - move to the beginning of the current line.
    + - move to the first non-blank character on the current line. (nordic mac layout. otherwise: ^)
    $ - move to the end of the current line.
    % - move to the matching bracket when the cursor is already on a bracket.

You can as well move on a specific character on your line using:

    f<character> - find a character after your cursor.
    F<character> - find a character before your cursor.
    t<character> - move to a character after your cursor.
    T<character> - move to a character before your cursor.

After using one of the last four keystrokes, you can move on the character you’ve chosen with ; to go forward, and , to go backward. A very powerful way to move horizontally!jk:w
