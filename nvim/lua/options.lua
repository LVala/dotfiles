local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

local o = vim.opt
o.cursorline = true
o.hlsearch = false
o.number = true
o.scrolloff = 8
o.showmode = false
o.sidescrolloff = 4
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = false

o.swapfile = false
o.undofile = true

-- indent related options are expected to be set
-- by guess-indent.nvim, this is just a fallback
o.shiftround = true
o.shiftwidth = 2
o.tabstop = 3
