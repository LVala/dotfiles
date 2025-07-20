return {
  "lewis6991/gitsigns.nvim",
  keys = function()
    local gitsigns = require("gitsigns")

    return {
      { "<leader>hb", function() gitsigns.blame_line({full = true}) end },
      { "<leader>hs", gitsigns.stage_hunk },
      { "<leader>hr", gitsigns.reset_hunk },
      { "<leader>hp", gitsigns.preview_hunk },
      { "[c", function() gitsigns.nav_hunk("prev") end },
      { "]c", function() gitsigns.nav_hunk("next") end },
    }
  end,
}
