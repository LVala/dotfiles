local k = vim.keymap

k.set("n", "Q", "<nop>")

k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzz")
k.set("n", "N", "Nzz")

k.set({ "n", "v" }, "<leader>y", [["+y]])
k.set("n", "<leader>Y", [["+Y]])
k.set({ "n", "v" }, "<leader>p", [["+p]])
k.set({ "n", "v" }, "<leader>P", [["+P]])
k.set({ "n", "v" }, "<leader>d", [["+d]])

k.set("v", "<", "<gv")
k.set("v", ">", ">gv")

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
