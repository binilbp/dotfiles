return {
  {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin")

      require('lualine').setup {
        options = {
          theme = 'catppuccin-nvim'
        }
      }
    end,
  },
}
