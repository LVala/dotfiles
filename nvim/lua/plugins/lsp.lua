return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "ibhagwan/fzf-lua",
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
      opts = { ui = { border = "rounded" } },
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

        local fzf = require("fzf-lua")
        map("grr", fzf.lsp_references)
        map("gri", fzf.lsp_implementations)
        map("gO", fzf.lsp_document_symbols)
        map("gra", fzf.lsp_code_actions)

        map("gd", fzf.lsp_definitions)
        map("gD", fzf.lsp_declarations)
        map("grt", fzf.lsp_typedefs)
        map("gwO", fzf.lsp_workspace_symbols)
        map("grf", vim.lsp.buf.format)

        map("gl", vim.diagnostic.open_float)
        map("grl", fzf.diagnostics_document)

        local signs = { ERROR = "󰅚 ", WARN = "󰀪 ", HINT = "󰌶 ", INFO = "󰋽 " }
        vim.diagnostic.config({
          severity_sort = true,
          signs = { text = signs }
        })
      end,
    })
  end,
}
