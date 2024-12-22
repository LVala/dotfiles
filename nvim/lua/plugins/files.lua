return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local mini_files = require("mini.files")

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesWindowOpen",
      callback = function(args)
        local win_id = args.data.win_id
        local config = vim.api.nvim_win_get_config(win_id)
        config.border = "rounded"
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })

    mini_files.setup()
    vim.keymap.set("n", "<leader>t", function()
      if not mini_files.close() then mini_files.open() end
    end)
  end
}
