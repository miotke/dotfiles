local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {

  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
    --  presets = {
    --    operators = false,
    --    motions = false,
    --    text_objects = false,
    --    windows = false,
    --    nav = false,
    --    z = false,
    --    g = false,
    --  },
    },
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    show_help = true,
    show_keys = true,
    --disable = {
    --  buftypes = {},
    --  filetypes = { "TelescopePrompt" },
    --},
  }

  local opts = {
    mode = "n", -- NORMAL mode
    --prefix = "<leader>",
    nowait = false,
  }

  which_key.register(mappings, opts)
end

return M
