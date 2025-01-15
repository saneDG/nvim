return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
  config = function()
    local harpoon = require('harpoon')
    local Extensions = require("harpoon.extensions")
    local Path = require("plenary.path")

    harpoon:setup()

    -- set cursor position at current file position if file is in the list
    -- https://github.com/pockata/harpoon-highlight-current-file
    harpoon:extend({
      [Extensions.event_names.UI_CREATE] = function(ctx)
        local current = Path:new(ctx.current_file)
            :make_relative(vim.uv.cwd())
            :gsub("\\", "\\\\")
        local regex = "\\V" .. current .. "\\$"
        -- highlight the line
        vim.fn.matchadd("HarpoonCurrentFile", regex)
        -- move the cursor to the line
        vim.fn.search(regex)
      end,
    })

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end
}
