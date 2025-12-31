vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8  -- ignored with wrap = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '↳ '

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4 -- overwritten by vim-sleuth

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "•", nbsp = "␣" }
