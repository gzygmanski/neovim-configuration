local keymap = vim.api.nvim_set_keymap

local d_pairs = {"()", "{}", "[]", "<>", "''", "\"\"", "``"}

function is_empty_pair(str)
  for key, value in ipairs(d_pairs) do if str == value then return 1 end end
  return 0
end

function within_empty_pair()
  local current = vim.fn.strpart(vim.fn.getline("."), vim.fn.col(".") - 2, 2)
  return is_empty_pair(current)
end

local function set_keybindings()
  local keybindings = {
    -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

    -- disable keys
    {"n", "Q", "<Nop>", {noremap = true, silent = true}},

    -- quit, write & reload
    {
      "n", "<leader>q",
      "len(filter(getbufinfo(), \"v:val.listed == 1\")) == 1 ? \"<CMD>qa!<CR>\" : \"<CMD>BufferWipeout!<CR>\"",
      {expr = true, noremap = false, silent = true}
    }, {"n", "<leader><Esc>", "<CMD>q!<CR>", {noremap = true, silent = true}},
    {"n", "<leader>Q", "<CMD>qa!<CR>", {noremap = true, silent = true}},
    {"n", "<leader>w", "<CMD>w!<CR>", {noremap = true, silent = true}}, {
      "n", "<Leader>r", "<CMD>source ~/.config/nvim/init.vim<CR>",
      {noremap = true, silent = false}
    }, -- terminal
    {
      "n", "te", "<CMD>term<CR><CMD>BufferMove 1<CR>",
      {noremap = true, silent = true}
    }, {"n", "tv", "<CMD>vsplit +term<CR>", {noremap = true, silent = true}},
    {"n", "ts", "<CMD>split +term<CR>", {noremap = true, silent = true}},
    {"t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true}},

    -- clipboard
    {"v", "<leader>yy", "\"*yy", {noremap = true, silent = true}},
    {"v", "<leader>y", "\"*y", {noremap = true, silent = true}},
    {"v", "<leader>Y", "\"*Y", {noremap = true, silent = true}},
    {"n", "<leader>p", "\"*p", {noremap = true, silent = true}},
    {"n", "<leader>P", "\"*P", {noremap = true, silent = true}}, -- buffers
    {"n", "<leader>ne", "<CMD>enew<CR>", {noremap = true, silent = true}},
    {"n", "<leader>nv", "<CMD>vnew<CR>", {noremap = true, silent = true}},
    {"n", "<leader>ns", "<CMD>new<CR>", {noremap = true, silent = true}},

    {"n", "<leader>s", "<C-w>s", {noremap = true, silent = true}},
    {"n", "<leader>v", "<C-w>v", {noremap = true, silent = true}},

    {"n", "<Tab>", "<C-w>w", {noremap = true, silent = true}},
    {"n", "<C-H>", "<C-w>h", {noremap = true, silent = true}},
    {"n", "<C-J>", "<C-w>j", {noremap = true, silent = true}},
    {"n", "<C-K>", "<C-w>k", {noremap = true, silent = true}},
    {"n", "<C-L>", "<C-w>l", {noremap = true, silent = true}},

    {"n", "mh", "<C-w>H", {noremap = true, silent = true}},
    {"n", "mj", "<C-w>J", {noremap = true, silent = true}},
    {"n", "mk", "<C-w>K", {noremap = true, silent = true}},
    {"n", "ml", "<C-w>L", {noremap = true, silent = true}},

    {
      "n", "mrr", "<CMD>NvimTreeClose<CR><C-w>r",
      {noremap = true, silent = true}
    },
    {
      "n", "mrx", "<CMD>NvimTreeClose<CR><C-w>x",
      {noremap = true, silent = true}
    }, {"n", "<S-h>", "<CMD>BufferPrev<CR>", {noremap = true, silent = true}},
    {"n", "<S-l>", "<CMD>BufferNext<CR>", {noremap = true, silent = true}}, {
      "n", "<leader>aq", "<CMD>BufferCloseAllButCurrent<CR>",
      {noremap = true, silent = true}
    }, -- {'n', 'mt', '<C-w>T', {noremap = true, silent = true}},
    {"n", "me", "<CMD>NvimTreeClose<CR><C-w>=", {noremap = true, silent = true}},
    {
      "n", "mm", "<CMD>NvimTreeClose<CR><C-w>_<C-w>|",
      {noremap = true, silent = true}
    },

    {"n", "mrh", "<CMD>vertical res -20<CR>", {noremap = true, silent = true}},
    {"n", "mrj", "<CMD>res +10<CR>", {noremap = true, silent = true}},
    {"n", "mrk", "<CMD>res -10<CR>", {noremap = true, silent = true}},
    {"n", "mrl", "<CMD>vertical res +20<CR>", {noremap = true, silent = true}},

    -- movement
    {"n", "gi", "^", {noremap = true, silent = true}},
    {"n", "ga", "<C-^>", {noremap = true, silent = true}}, -- edit
    {"n", "J", "<CMD>m+<CR>", {noremap = true, silent = true}},
    {"n", "K", "<CMD>m-2<CR>", {noremap = true, silent = true}}, {
      "i", "<leader>a",
      "<Left><CMD>call search(\"\\\\%\" . line(\".\") . \"l\\\\()\\\\|}\\\\|]\\\\|>\\\\|'\\\\|\\\"\\\\|`\\\\)\", \"We\")<CR><Right>",
      {noremap = false, silent = true}
    }, {"i", "((", "()<left>", {noremap = true, silent = true}},
    {"i", "{{", "{}<left>", {noremap = true, silent = true}},
    {"i", "[[", "[]<left>", {noremap = true, silent = true}},
    {"i", "<<", "<><left>", {noremap = true, silent = true}},
    {"i", "''", "''<left>", {noremap = true, silent = true}},
    {"i", "\"\"", "\"\"<left>", {noremap = true, silent = true}},
    {"i", "``", "``<left>", {noremap = true, silent = true}},
    {"i", "<leader>cb", "```<CR>```<Esc>ko", {noremap = true, silent = true}},
    {"i", "(<CR>", "(<CR>)<Esc>O", {noremap = true, silent = true}},
    {"i", "{<CR>", "{<CR>}<Esc>O", {noremap = true, silent = true}},
    {"i", "[<CR>", "[<CR>]<Esc>O", {noremap = true, silent = true}}, {
      "i", "<BS>", "v:lua.within_empty_pair() ? \"<Right><BS><BS>\" : \"<BS>\"",
      {expr = true, noremap = true, silent = true}
    }, {
      "i", "<CR>", "v:lua.within_empty_pair() ? \"<CR><Esc>O\" : \"<CR>\"",
      {expr = true, noremap = true, silent = true}
    }, {
      "i", "<Space>",
      "v:lua.within_empty_pair() ? \"<Space><Space><Left>\" : \"<Space>\"",
      {expr = true, noremap = true, silent = true}
    }, -- snippets
    {
      "i", "<leader>e",
      "vsnip#available(1) ? \"<Plug>(vsnip-expand)\" : \"<leader>e\"",
      {expr = true, noremap = false, silent = false}
    }, {
      "i", "<leader>n",
      "vsnip#available(1) ? \"<Plug>(vsnip-jump-next)\" : \"<leader>n\"",
      {expr = true, noremap = false, silent = false}
    }, {
      "i", "<leader>s",
      "vsnip#available(1) ? \"<Plug>(vsnip-jump-next)\" : \"<leader>n\"",
      {expr = true, noremap = false, silent = false}
    }, {
      "i", "<leader>m",
      "vsnip#available(1) ? \"<Plug>(vsnip-jump-prev)\" : \"<leader>m\"",
      {expr = true, noremap = false, silent = false}
    }, -- lsp 
    {
      "n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gn", "<CMD>lua vim.diagnostic.goto_next()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gp", "<CMD>lua vim.diagnostic.goto_prev()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gq", "<CMD>lua vim.diagnostic.setqflist()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "gh", "<CMD>lua vim.lsp.buf.hover()<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>",
      {noremap = true, silent = true}
    }, -- files
    {
      "n", "<C-f>",
      "<CMD>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').no_preview))<CR>",
      {noremap = true, silent = true}
    }, {
      "n", "<leader>gb",
      "<CMD>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').no_preview))<CR>",
      {noremap = true, silent = false}
    }, {
      "n", "<C-s>",
      "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').no_preview))<CR>",
      {noremap = true, silent = false}
    }, {
      "n", "<leader>gr",
      "<CMD>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').preview))<CR>",
      {noremap = true, silent = false}
    }, {
      "n", "<leader>gc",
      "<CMD>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').no_preview))<CR>",
      {noremap = true, silent = false}
    }, {
      "n", "<C-Space>",
      "<CMD>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown(require('./plugins/telescope_style').preview))<CR>",
      {noremap = true, silent = false}
    },

    {"n", "<C-n>", "<CMD>NvimTreeToggle<CR>", {noremap = true, silent = true}},

    -- git
    {
      "n", "gs", "<CMD>lua require('neogit').status.create('split')<CR>",
      {noremap = true, silent = true}
    }, {"n", "do", ":DiffviewOpen ", {noremap = true, silent = false}},
    {"n", "dq", "<CMD>DiffviewClose<CR>", {noremap = true, silent = true}}, {
      "n", "zS",
      "<CMD>lua require'neuron'.rib {address = '192.168.2.100:8200', verbose = false}<CR>",
      {noremap = false, silent = true}
    }
  }

  for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end

vim.cmd("let mapleader=\",\"")
set_keybindings()
