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


-- lazy plugin setup
require("config.lazy")





