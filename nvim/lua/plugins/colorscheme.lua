return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local lackluster = require("lackluster")

    require('nvim-web-devicons').setup({
      color_icons = false,
      override = {
        ["default_icon"] = {
          color = lackluster.color.gray4,
          name = "Default",
        }
      }
    })

    local opts = {
      tweak_syntax = {
        comment = lackluster.color.gray4,
      },
      tweak_background = {
        normal = "none",
        telescope = "none",
        popup = "none",
        menu = "none"
      },
    }

    lackluster.setup(opts)
    vim.cmd.colorscheme("lackluster-hack")
  end,
}
