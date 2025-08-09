return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
    indent = {
      enabled = true,
      scope = { enabled = false },
    },
  },
  keys = function()
    local picker = require("snacks").picker

    return {
      { "<leader>f", picker.files },
      { "<leader>g", picker.git_status },
      { "<leader>b", picker.buffers },
      { "<leader>*", picker.grep_word },
      { "<leader>/", picker.grep },
      { "<leader>r", picker.resume },
    }
  end
}
