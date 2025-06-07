return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = { component_separators = "", section_separators = "" },
    sections = {
      lualine_a = { "branch" },
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "diagnostics", "progress", "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
