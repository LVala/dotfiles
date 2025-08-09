return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
  opts = { transparent = true },
  config = function(_, opts)
    require("kanso").setup(opts)
    vim.cmd.colorscheme("kanso-zen")
  end
}
