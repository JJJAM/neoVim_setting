local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存文件自动更新
--
--
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])



return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- 主题
  use {
      'nvim-lualine/lualine.nvim',
      require = { 'kyazdani42/nvim-web-devicons', opt = true } -- 状态栏图标
  }
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
  }
  -- 导航跳转
  use("christoomey/vim-tmux-navigator")
  -- 语法高亮
  use "nvim-treesitter/nvim-treesitter"
  -- 括号提示
  use "p00f/nvim-ts-rainbow"

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",  -- 这个相当于mason.nvim和lspconfig的桥梁
    "neovim/nvim-lspconfig"
  }

    -- 自动补全
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'glepnir/dashboard-nvim',
    -- event = 'VimEnter',
    -- config = function()
    --   require('dashboard').setup {
    --     -- config
    --   }
    -- end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  if packer_bootstrap then
    require('packer').sync()
  end
end)
