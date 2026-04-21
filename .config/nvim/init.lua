-- remove default welcome screen
vim.opt.shortmess:append('I')

-- disable netrw for nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- enable line number and make it relative
vim.opt.number = true
vim.opt.relativenumber = true

-- set tab width to be 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- enable system clipboard for nvim
vim.opt.clipboard = "unnamedplus"

-- exit terminal mode upon three esc button press
vim.keymap.set('t', '<Esc><Esc><Esc>', '<cmd>ToggleTerm<cr>', { desc = 'Hide terminal' })

-- lazy plugin setup
require("config.lazy")





