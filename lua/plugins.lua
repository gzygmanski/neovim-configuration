-- check if packer is installed (~/local/share/nvim/site/pack)
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Hent packer.nvim? (y for yada)") ~= "y" then return end

  local directory = string.format('%s/site/pack/packer/opt/',
    vim.fn.stdpath('data'))

  vim.fn.mkdir(directory, 'p')

  local git_clone_cmd = vim.fn.system(string.format('git clone %s %s',
    'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim'))

  print(git_clone_cmd)
  print("Henter packer.nvim...")

  return
end

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  -- editing
  use {'editorconfig/editorconfig-vim'}
  use {'tpope/vim-commentary'}
  use {'JoosepAlviste/nvim-ts-context-commentstring'}
  use {'tpope/vim-surround'}
  use {'mattn/emmet-vim'}

  -- utility
  use {'kyazdani42/nvim-tree.lua'}
  use {'TimUntersberger/neogit'}
  -- use {
  --   'gzygmanski/neuron.nvim',
  --   branch = 'match-links',
  --   requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
  -- }

  -- lsp
  use {'neovim/nvim-lspconfig', requires = {'glepnir/lspsaga.nvim'}}
  use {'hrsh7th/nvim-compe', requires = {'hrsh7th/vim-vsnip'}}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim'
    }
  }
  use {'lukas-reineke/format.nvim'}

  -- theme
  use {'gzygmanski/nord-vim'}
  use {'romgrk/barbar.nvim'}
  use {'glepnir/galaxyline.nvim', branch = 'main'}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)
