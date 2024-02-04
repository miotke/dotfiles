-- [[ Basic Keymaps ]]
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
 
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keeps current line in the center when searching
keymap("n", "n", "nzz")

 -- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Toggle relativenumbers
keymap("n", "<leader>n", function()
   -- sort of a "ternary" operator in lua
   vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
   vim.o.relativenumber = not vim.o.relativenumber               
end, { desc = "Toggles relativenumbers off and on" })

