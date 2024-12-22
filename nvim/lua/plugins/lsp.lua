return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "telescope-nvim/telescope.nvim",
    "saghen/blink.cmp",
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
      opts = {
        ui = { border = "rounded" }
      }
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = true
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
      callback = function(event)
        local function map(k, f)
          vim.keymap.set("n", k, f, { buffer = event.buf })
        end

        local builtin = require("telescope.builtin")
        map("gd", builtin.lsp_definitions)
        map("gD", vim.lsp.buf.declaration)
        map("gr", builtin.lsp_references)
        map("gi", builtin.lsp_implementations)
        map("go", builtin.lsp_type_definitions)
        map("gl", vim.diagnostic.open_float)
        map("<leader>ws", builtin.lsp_dynamic_workspace_symbols)
        map("<leader>cr", vim.lsp.buf.rename)
        map("<leader>ca", vim.lsp.buf.code_action)
        map("<leader>cf", vim.lsp.buf.format)
        map("K", vim.lsp.buf.hover)
      end,
    })

    local capabilities = require("blink-cmp").get_lsp_capabilities()
    local handlers = {
      ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
      ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
    }

    require("mason-lspconfig").setup_handlers({
      function(server)
        require("lspconfig")[server].setup({ handlers = handlers, capabilities = capabilities })
      end
    })

    local signs = { ERROR = "󰅚 ", WARN = "󰀪 ", HINT = "󰌶 ", INFO = "󰋽 " }
    vim.diagnostic.config({
      float = { border = 'rounded' },
      severity_sort = true,
      signs = { text = signs }
    })
  end,
}
