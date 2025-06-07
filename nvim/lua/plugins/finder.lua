return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    fzf_colors = true,
    defaults = {
      color_icons = false,
    },
    grep = {
      -- the default options with --color=always removed
      rg_opts = "--column --line-number --no-heading --smart-case --max-columns=4096 -e",
    }
  },
  keys = function()
    local fzf = require("fzf-lua")

    return {
      { "<leader>f", fzf.files },
      { "<leader>g", fzf.git_status },
      { "<leader>b", fzf.buffers },
      { "<leader>*", fzf.grep_cword },
      { "<leader>/", fzf.grep_project },
      { "<leader>r", fzf.resume },
    }
  end,
}
