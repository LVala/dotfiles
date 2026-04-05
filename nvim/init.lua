----- OPTIONS -----
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
vim.opt.listchars = {tab = "» ", trail = "•", nbsp = "␣"}

-- showmatch?
-- confirm?
-- smoothscroll?
-- fillchars?
-- colorcolumn
-- completeopt?
-- vim.cmd.filetype("plugin indent on") ?

----- KEYMAPS -----
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", {clear = true}),
  callback = function() vim.highlight.on_yank() end,
})

----- PLUGINS ------
-- dependencies, plugins without setup
vim.pack.add {
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/tpope/vim-sleuth",
}

-- colorscheme
vim.pack.add {"https://github.com/webhooked/kanso.nvim"}
require("kanso").setup {transparent = true}
vim.cmd.colorscheme("kanso-zen")

-- file explorer
vim.pack.add {"https://github.com/echasnovski/mini.files"}
local mf = require("mini.files")
mf.setup {
    mappings = {
        close = "<Esc>",
        go_in = "L",
        go_in_plus = "l",
    },
}

vim.keymap.set("n", "<leader>t", function() return not mf.close() and mf.open() end)

-- snacks (fuzzy finder, indent lines)
vim.pack.add {"https://github.com/folke/snacks.nvim"}
require("snacks").setup {picker = {}, indent = {}}
local picker = require("snacks").picker

vim.keymap.set("n", "<leader>f", picker.files)
vim.keymap.set("n", "<leader>g", picker.git_status)
vim.keymap.set("n", "<leader>b", picker.buffers)
vim.keymap.set("n", "<leader>*", picker.grep_word)
vim.keymap.set("n", "<leader>/", picker.grep)
vim.keymap.set("n", "<leader>r", picker.resume)

-- lsp
vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    "https://github.com/j-hui/fidget.nvim",
}
require("fidget").setup {notification = {window = {border = "rounded", winblend = 0}}}
require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config {
    severity_sort = true,
    signs = {text = {ERROR = "󰅚 ", WARN = "󰀪 ", HINT = "󰌶 ", INFO = "󰋽 "}}
}

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspAttach", {clear = true}),
    callback = function(event)
        local map = function(k, f) vim.keymap.set("n", k, f, {buffer = event.buf}) end

        map("grr", picker.lsp_references)
        map("gri", picker.lsp_implementations)
        map("gO", picker.lsp_symbols)

        map("gd", picker.lsp_definitions)
        map("gD", picker.lsp_declarations)
        map("grt", picker.lsp_type_definitions)
        map("gwO", picker.lsp_workspace_symbols)
        map("grf", vim.lsp.buf.format)

        map("gl", vim.diagnostic.open_float)
        map("grl", picker.diagnostics_buffer)
    end,
})

-- completions
vim.pack.add {
    {src = "https://github.com/saghen/blink.cmp", version = vim.version.range("v1.*")},
    "https://github.com/rafamadriz/friendly-snippets",
}
require("blink.cmp").setup {
    completion = {
        documentation = {auto_show = true},
    },
    signature = {enabled = true},
}

-- git
vim.pack.add {"https://github.com/lewis6991/gitsigns.nvim"}
local gitsigns = require("gitsigns")
gitsigns.setup()
vim.keymap.set("n", "<leader>hb", function() gitsigns.blame_line {full = true} end)
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
vim.keymap.set("n", "[c", function() gitsigns.nav_hunk("prev") end)
vim.keymap.set("n", "]c", function() gitsigns.nav_hunk("next") end)

-- statusline
vim.pack.add {"https://github.com/nvim-lualine/lualine.nvim"}
require("lualine").setup {
    options = {component_separators = "", section_separators = ""},
    sections = {
      lualine_a = {"mode"},
      lualine_b = {"branch", "diff"},
      lualine_c = {{"filename", path = 1}},
      lualine_x = {"diagnostics"},
      lualine_y = {"progress"},
      lualine_z = {"location"},
    },
}

-- treesitter
-- TODO: update to `main` treesitter
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add {{src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master"}}
require("nvim-treesitter.configs").setup {
    auto_install = true,
    highlight = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = true },
}

-- TODO: other
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- https://github.com/OXY2DEV/markview.nvim
-- https://github.com/stevearc/conform.nvim
-- https://github.com/sindrets/diffview.nvim
-- https://github.com/ggandor/leap.nvim
-- debugging stuff (DAP)
-- built-in neovim plugins
