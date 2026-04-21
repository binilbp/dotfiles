return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  
  config = function()
    -- We pass your settings into the treesitter setup function
    require("nvim-treesitter.configs").setup({
      ensure_installed = { 
          "c", 
          "lua", 
          "vim", 
          "vimdoc", 
          "markdown", 
          "rust",
      },
      highlight = {
         enable = true,
         additional_vim_regex_highlighting = false,
      }, -- <-- The missing comma has been added here!
    
      -- for this to work, tree-sitter-cli is required.
      -- Install it in OS
      auto_install = true,
    })
  end,
}
