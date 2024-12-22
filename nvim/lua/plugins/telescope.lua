return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({ defaults = { layout_strategy = "vertical" } })
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("undo")
  end,
  keys = function()
    local builtin = require("telescope.builtin")
    local telescope = require("telescope")

    return {
      { "<leader>f", builtin.find_files },
      { "<leader>g", builtin.git_status },
      { "<leader>b", builtin.buffers },
      { "<leader>*", builtin.grep_string },
      { "<leader>/", builtin.live_grep },
      { "<leader>r", builtin.resume },
      { "<leader>u", telescope.extensions.undo.undo },
    }
  end,
}
