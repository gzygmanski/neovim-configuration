-- packer
require("plugins")

-- basic settings
require("settings")
require("keybindings")

-- lsp
require("plugins/codeformatter")
require("plugins/completion")
require("plugins/lsp")

-- plugins
require("plugins/treesitter")
require("plugins/galaxyline")
require("plugins/barbar")
require("plugins/nvimTree")
require("plugins/neogit")
require("plugins/diffview")
require("plugins/commentstring")

-- custom buffers
vim.api.nvim_exec([[
  autocmd TermOpen * setlocal signcolumn=no nonu nornu wrap linebreak
  autocmd FileType NvimTree setlocal signcolumn=no nu rnu
  autocmd FileType markdown setlocal spell spelllang=pl,en tw=80 wrap linebreak
  autocmd FileType html,css,javascript,javascriptreact,typescriptreact EmmetInstall
]], true)

-- auto-format
vim.api.nvim_exec([[
  augroup Format
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWritePost * FormatWrite
  augroup END
]], true)
