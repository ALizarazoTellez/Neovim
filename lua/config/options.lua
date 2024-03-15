-- Neovim built-in configuration.

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Folds.
vim.opt.foldminlines = 7

-- Line wrap.
vim.opt.textwidth = 78
vim.opt.wrap = false
vim.opt.linebreak = true

-- Line number.
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs.
vim.opt.expandtab = false -- Always use tabs.
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3 -- Show existing tabs with 3 spaces width.
