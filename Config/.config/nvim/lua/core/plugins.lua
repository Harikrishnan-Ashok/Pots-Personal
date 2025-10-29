local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- Statusline plugin
  use 'nvim-lualine/lualine.nvim'

  -- Transparency plugin
  use 'xiyaowong/transparent.nvim'

  -- Auto-close brackets
  use 'windwp/nvim-autopairs'

  -- Show key bindings popup
  use 'folke/which-key.nvim'

  -- Dev Icons
  use 'nvim-tree/nvim-web-devicons'

  -- File Explorer
  use 'nvim-tree/nvim-tree.lua'

  -- Conquer of Completion (CoC) with release branch
  use {
    'neoclide/coc.nvim',
    branch = 'release'
  }

  -- Lua utility functions for Neovim
  use 'nvim-lua/plenary.nvim'

  -- Telescope fuzzy finder, pinned to tag v0.1.8
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }  -- Telescope depends on plenary.nvim
  }
	-- Catppuccin
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Bamboo color scheme
  use {
    'ribru17/bamboo.nvim',
    config = function()
      require('bamboo').setup({
        -- optional config here
      })
      require('bamboo').load()
    end,
  }

  -- Bluloco theme (depends on lush.nvim)
  use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
  }

  -- Automatically sync packer if just installed
  if packer_bootstrap then
    require('packer').sync()
  end
end)
