return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("terafox")
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", config = true, main = "ibl" },
  { "numToStr/Comment.nvim",               config = true },
  { "lewis6991/gitsigns.nvim",             config = true },
  { "nmac427/guess-indent.nvim",           config = true },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        indent = { enable = true },
        highlight = { enable = true },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "telescope-nvim/telescope.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
        callback = function(event)
          local function map(k, f)
            vim.keymap.set("n", k, f, { buffer = event.buffer })
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

      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          function(server)
            require("lspconfig")[server].setup({ capabilities = capabilities })
          end
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      luasnip.config.setup()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({ defaults = { layout_strategy = "vertical" } })
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<leader>f", builtin.find_files },
        { "<leader>g", builtin.git_status },
        { "<leader>b", builtin.buffers },
        { "<leader>*", builtin.grep_string },
        { "<leader>/", builtin.live_grep },
        { "<leader>r", builtin.resume },
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = { "branch" },
        lualine_c = {
          { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
          { "filename", path = 4 },
        },
        lualine_x = { "diagnostics" },
        lualine_y = { "progress" },
        lualine_z = {},
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      view = {
        float = {
          enable = true,
          open_win_config = function()
            return {
              border = "rounded",
              relative = "editor",
              row = 2,
              col = 4,
              width = 50,
              height = math.floor(vim.opt.lines:get() * 0.8)
            }
          end,
        },
      },
    },
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<cr>" },
      { "<Esc>",     "<cmd>NvimTreeClose<cr>" }
    },
  },
}
