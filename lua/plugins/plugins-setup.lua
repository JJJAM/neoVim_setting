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
  use("christoomey/vim-tmux-navigator")
  use "nvim-treesitter/nvim-treesitter"
  use "p00f/nvim-ts-rainbow"
  if packer_bootstrap then
    require('packer').sync()
  end
end)
