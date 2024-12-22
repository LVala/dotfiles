vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt
o.completeopt = "menuone,noselect"
o.cursorline = true
o.hlsearch = false
o.number = true
o.scrolloff = 8
o.sidescrolloff = 4
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = false

o.swapfile = false
o.undofile = true

o.list = true
o.listchars = { tab = "» ", trail = "•", nbsp = "␣" }

-- indent related options are expected to be set
-- by vim-sleuth, this is just a fallback
o.shiftround = true
o.shiftwidth = 2
o.tabstop = 3
