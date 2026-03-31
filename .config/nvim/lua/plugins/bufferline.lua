return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy =false,
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
    options = {
      mode = "buffers", -- Shows your open files as tabs
      always_show_bufferline = true,
      diagnostics = "nvim_lsp", -- Show error icons right in the tab!
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
