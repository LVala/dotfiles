return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "j-hui/fidget.nvim", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip"
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local cmp = require("cmp")

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      lsp_zero.set_sign_icons({
        error = "",
        warn = "",
        hint = "󰌶",
        info = ""
      })

      cmp.setup({
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })

      require("mason").setup({})
      require("mason-lspconfig").setup({
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.load_extension("fzf")
      telescope.setup(opts)
    end,
    opts = {
      defaults = {
        layout_strategy = "vertical"
      },
    },
    keys = {
      {"<leader>f", "<cmd>Telescope find_files<cr>"},
      {"<leader>g", "<cmd>Telescope live_grep<cr>"},
    },
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
        lualine_x = { "filetype" },
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("nightfox").setup(opts)
      vim.cmd.colorscheme("terafox")
    end,
    opts = {
      options = {
        -- transparent = true,
        styles = {
          comments = "italic",
        },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = true,
  },
  {
    "nmac427/guess-indent.nvim",
    config = true,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    },
    keys = {
      {"<leader>t", "<cmd>NvimTreeToggle<cr>"},
    },
  },
}
-- TODO
-- nvim-surround
-- vim-illuminate
-- oil
-- harpoon
-- git stuff
-- obsidian.nvim
