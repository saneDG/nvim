return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    require("black-metal").setup({
      -- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | venom
      theme = "gorgoroth",
      -- Can be one of: 'light' | 'dark', or set via vim.o.background
      variant = "dark",
      -- Use an alternate, darker bg
      alt_bg = false
    })
    require("black-metal").load()
  end,
}
