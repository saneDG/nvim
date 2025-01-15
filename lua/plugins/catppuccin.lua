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
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
      })
      -- Set the theme to your preferred flavor, for example "Mocha"
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
