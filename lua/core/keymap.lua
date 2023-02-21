vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")


keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
