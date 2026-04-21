return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("dracula")

      -- Setup lualine AFTER the colorscheme is loaded
      require('lualine').setup {
        options = {
          theme = 'dracula-nvim'
        }
      }
    end,
  },
}
