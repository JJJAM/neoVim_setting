local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 索引
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
-- opt.clipboard:append("unnameplus")

-- 默认新窗口右下
opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase  = true

opt.termguicolors = true
opt.signcolumn    = "yes"

vim.cmd[[colorscheme tokyonight-moon]]
vim.cmd[[set wrap]]
