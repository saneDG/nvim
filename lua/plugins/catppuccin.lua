return {
  {
    "catppuccin/nvim", -- Plugin repository
    lazy = false,      -- Load the theme immediately
    priority = 1000,   -- Ensure it loads before other plugins
    config = function()
      -- Optional: Configure any additional custom settings
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#0a0a0a",
            mantle = "#0a0a0a",
            crust = "#0a0a0a",
          },
        },
      })
      -- Set the theme to your preferred flavor, for example "Mocha"
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
