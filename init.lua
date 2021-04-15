-- packer
require('plugins')

-- basic settings
require('settings')
require('keybindings')

-- lsp
require('plugins/codeformatter')
require('plugins/completion')
require('plugins/lsp')

-- plugins
require('plugins/treesitter')
require('plugins/galaxyline')
require('plugins/telescope')
require('plugins/barbar')
require('plugins/nvimTree')
require('plugins/neogit')

-- custom buffers
vim.api.nvim_exec([[
  autocmd TermOpen * setlocal signcolumn=no nonu nornu
  autocmd FileType NvimTree setlocal signcolumn=no nu rnu
  autocmd FileType vimwiki setlocal spell spelllang=pl,en
  autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
]], true)

-- auto-format
vim.api.nvim_exec([[
  augroup Format
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
  augroup END
]], true)
