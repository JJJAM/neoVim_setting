vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<leader>h", ":bnext<CR>")
keymap.set("n", "<leader>l", ":bprevious<CR>")

-- 打开关闭文件树
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- 格式化json
keymap.set("n", "<leader>jj", "<ESC>:%!python3 -m json.tool<CR>")

-- 预览markdown
keymap.set("n", "<leader>m", ":MarkdownPreviewToggle<CR>")
