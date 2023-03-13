vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")


keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 格式化json
keymap.set("n", "<leader>jj", "<ESC>:%!python3 -m json.tool<CR>")
