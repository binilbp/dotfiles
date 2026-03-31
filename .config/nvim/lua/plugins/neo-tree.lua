return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but highly recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>h", -- Optional: keeps your 'focus' muscle memory
      function()
        require("neo-tree.command").execute({ focus = true, dir = vim.uv.cwd() })
      end,
      desc = "Focus Explorer",
    },
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
        },
        git_status = {
          symbols = {
            -- Change type
            added     = "",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
      },
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["<space>"] = "none", -- disable space to keep leader key mapping fast
          ["l"] = "open",
          ["h"] = "close_node",
        }
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
        },
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
      },
    })
  end,
}
