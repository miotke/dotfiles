-- Map leader key to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = 'Indent to the left' })
vim.keymap.set("v", ">", ">gv", { desc = 'Indent to the right' })

-- [[ NVIM-MACRO KEYMAPS ]]
-- Wraps current line in double quotes and appends a comma
vim.keymap.set('n', '<leader>mq', 'i"<Esc>$a",<Esc>j^', { remap = true, desc = "Wrap current line in double quotes" })

-- Toggle indent-blankline rainbow colors
vim.keymap.set('n', '<leader>tr', function()
  _G.toggle_indent_rainbow()
end, { desc = "Toggle Rainbow Indents" })

-- Toggle line highlighting (cursorline)
vim.keymap.set('n', '<leader>hl', function()
  vim.wo.cursorline = not vim.wo.cursorline
  vim.notify("Cursorline: " .. (vim.wo.cursorline and "Enabled" or "Disabled"))
end, { desc = "Toggle line highlighting" })
