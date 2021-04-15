local function setOptions(options)
  for key, val in pairs(options) do
    if val == true then
      vim.api.nvim_command('set ' .. key)
    elseif val == false then
      vim.api.nvim_command('set no' .. key)
    else
      vim.api.nvim_command('set ' .. key .. '=' .. val)
    end
  end
end

local options = {
  autoindent = true,
  autoread = true,
  backspace = 'indent,eol,start',
  compatible = false,
  completeopt = 'menu,menuone,noselect',
  cursorline = true,
  expandtab = true,
  fillchars = 'vert:│',
  hidden = true,
  ignorecase = true,
  incsearch = true,
  inccommand = 'split',
  laststatus = 2,
  linebreak = false,
  nohlsearch = true,
  noruler = true,
  nu = true,
  rnu = true,
  scrolloff = 8,
  shiftwidth = 2,
  showmatch = true,
  sidescrolloff = 5,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  ttimeoutlen = 10,
  undolevels = 1000,
  updatetime = 300,
  wrap = false,
}

setOptions(options)

vim.cmd('syntax on')
vim.cmd('colorscheme nord')
