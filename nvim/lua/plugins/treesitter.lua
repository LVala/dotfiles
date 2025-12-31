return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    indent = { enable = true },
    highlight = { enable = true },
  },
}
