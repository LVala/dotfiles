return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/snacks.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      config = true,
    },
    {
      "j-hui/fidget.nvim",
      opts = {
        notification = { window = { border = "rounded", winblend = 0 } }
      }
    },
    {
      "williamboman/mason.nvim",
      config = true
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = true,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
      callback = function(event)
        local function map(k, f)
          vim.keymap.set("n", k, f, { buffer = event.buf })
        end

        local picker = require("snacks").picker
        map("grr", picker.lsp_references)
        map("gri", picker.lsp_implementations)
        map("gO", picker.lsp_symbols)

        map("gd", picker.lsp_definitions)
        map("gD", picker.lsp_declarations)
        map("grt", picker.lsp_type_definitions)
        map("gwO", picker.lsp_workspace_symbols)
        map("grf", vim.lsp.buf.format)

        map("gl", vim.diagnostic.open_float)
        map("grl", picker.diagnostics_buffer)

        local signs = { ERROR = "󰅚 ", WARN = "󰀪 ", HINT = "󰌶 ", INFO = "󰋽 " }
        vim.diagnostic.config({
          severity_sort = true,
          signs = { text = signs }
        })
      end,
    })
  end,
}
