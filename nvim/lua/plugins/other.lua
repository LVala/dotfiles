return {
  "tpope/vim-sleuth",
  {
    "nvimdev/indentmini.nvim",
    config = true
  },
  { "echasnovski/mini.surround",
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  }
}
