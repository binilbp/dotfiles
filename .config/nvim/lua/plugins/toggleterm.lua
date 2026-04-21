return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Size of the terminal when it's split (not applicable for float)
    size = 15,
    -- Map a standard key to open/close the terminal
    open_mapping = [[<c-\>]], 
    hide_numbers = true, -- Hide the number column in toggleterm buffers
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true, -- Whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "float", -- Opens as a floating window hovering over your code
    close_on_exit = true, -- Close the terminal window when the process exits
    shell = vim.o.shell, -- Use your default shell (zsh in your case)
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  },
  keys = {
    -- Default toggle (uses the direction defined in opts above)
    { [[<C-\>]], desc = "Toggle Terminal" },
    
    -- Space + tf opens a floating terminal
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (Float)" },
    
    -- Space + t opens a horizontal split terminal at the bottom
    { "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Split)" },
  },
}
