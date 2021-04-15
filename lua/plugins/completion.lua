-- vsnip
vim.g.vsnip_snippet_dir = vim.fn.stdpath("config").."/snippets"
vim.g.vsnip_filetypes = {
  javascriptreact = { 'javascript' },
  typescriptreact = { 'javascript' }
}

-- emmet
vim.g.user_emmet_leader_key = '<leader>'
vim.g.user_emmet_mode = 'in'
vim.g.user_emmet_install_global = 0
vim.g.jsx_ext_required = 0
vim.g.user_emmet_settings = {
  javascriptreact = {
    extends = 'jsx',
  },
  typescriptreact = {
    extends = 'jsx',
  },
}

-- compe
require('compe').setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'disable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,

    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = true,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = false,
        treesitter = true,
    }
})
