local lspconfig = require('lspconfig')

USER = vim.fn.expand('$USER')

local sumneko_root_path = "/home/" .. USER ..
                            "/.config/nvim/lua-language-server"
local sumneko_binary = "/home/" .. USER ..
                         "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
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
  root_dir = function() return vim.loop.cwd() end
}

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  log_level = 3,
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
      diagnostic = {globals = {'vim'}},
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        },
        maxPreload = 2000,
        preloadFileSize = 1000
      },
      telemetry = {enable = false}
    }
  }
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

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {severity_limit = "Warning"},
    virtual_text = {spacing = 0, prefix = '', severity_limit = "Warning"},
    underline = false,
    update_in_insert = false
  })

local opts = {
  error_sign = '║',
  warn_sign = '║',
  hint_sign = '║',
  infor_sign = '║',
  dianostic_header_icon = '║',
  code_action_icon = '',
  finder_definition_icon = '',
  finder_reference_icon = '',
  definition_preview_icon = '',
  border_style = 0,
  rename_prompt_prefix = '',
  code_action_prompt = {
    enable = false
  }
}

require('lspsaga').init_lsp_saga(opts)
