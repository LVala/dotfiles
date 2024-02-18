local k = vim.keymap
k.set("n", "Q", "<nop>")

-- keep the cursor in the middle of the screen
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzz")
k.set("n", "N", "Nzz")

-- paste/yank to/from system clipboard
k.set({"n", "v"}, "<leader>y", [["+y]])
k.set("n", "<leader>Y", [["+Y]])
k.set({"n", "v"}, "<leader>p", [["+p]])
k.set({"n", "v"}, "<leader>P", [["+P]])
k.set({"n", "v"}, "<leader>d", [["+d]])

-- reselect text that has been indented
k.set("v", "<", "<gv")
k.set("v", ">", ">gv")

-- highlight yanked text
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
