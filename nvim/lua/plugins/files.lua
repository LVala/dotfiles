return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local mini_files = require("mini.files")

    mini_files.setup({
      mappings = {
        close = "<Esc>",
        go_in = "L",
        go_in_plus = "l",
      },
    })

    vim.keymap.set("n", "<leader>t", function()
      if not mini_files.close() then mini_files.open() end
    end)
  end
}
