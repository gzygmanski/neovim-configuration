local lspconfig = require('lspconfig')

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = false
}

lspconfig.tsserver.setup {
  filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
  root_dir = function() return vim.loop.cwd() end,
}

lspconfig.efm.setup {
    init_options = {documentFormatting = false, codeAction = false},
    filetypes = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'},
    settings = {
        languages = {
            javascript = {eslint},
            javascriptreact = {eslint},
            typescript = {eslint},
            typescriptreact = {eslint}
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = { severity_limit = "Warning" },
  virtual_text = { spacing = 0, prefix = '', severity_limit = "Warning" },
  underline = false,
  update_in_insert = false 
})

local opts = {
  error_sign               = '',
  warn_sign                = '',
  hint_sign                = 'ﲉ',
  infor_sign               = '',
  dianostic_header_icon    = '',
  code_action_icon         = '',
  finder_definition_icon   = '',
  finder_reference_icon    = '',
  definition_preview_icon  = '',
  border_style             = 0,
  rename_prompt_prefix     = ''
}

require('lspsaga').init_lsp_saga(opts)
