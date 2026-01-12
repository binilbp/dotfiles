return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      view = {
        side = "left",
      },
    })

    -- Toggle NvimTree
    vim.keymap.set("n", "<leader>e", function()
      api.tree.toggle()
    end, { desc = "Toggle NvimTree", silent = true })

    -- Focus NvimTree (left pane)
    vim.keymap.set("n", "<leader>h", function()
      api.tree.focus()
    end, { desc = "Focus NvimTree", silent = true })

    -- Focus editor (right pane)
    vim.keymap.set("n", "<leader>l", function()
      vim.cmd("wincmd l")
    end, { desc = "Focus editor", silent = true })
  end,
}

