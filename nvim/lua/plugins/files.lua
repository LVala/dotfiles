return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    mappings = {
      close = "<Esc>",
      go_in = "L",
      go_in_plus = "l",
    },
  },
  keys = function()
    local mf = require("mini.files")

    return {
      { "<leader>t", function() return not mf.close() and mf.open() end}
    }
  end,
}
