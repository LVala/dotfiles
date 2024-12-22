return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buf)
      local function map(k, f)
        vim.keymap.set("n", k, f, { buffer = buf })
      end
      local gitsigns = require("gitsigns")

      map("]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end)
      map("[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end)
      map("<leader>hb", function() gitsigns.blame_line({ full = true }) end)
      map("<leader>hs", gitsigns.stage_hunk)
      map("<leader>hu", gitsigns.undo_stage_hunk)
      map("<leader>hr", gitsigns.reset_hunk)
      map("<leader>hp", gitsigns.preview_hunk)
    end,
  },
}
