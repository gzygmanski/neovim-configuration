local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

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
  init_options = {
    hostInfo = 'neovim',
    documentFormatting = false,
    codeAction = false
  },
  filetypes = {
    'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
    'typescriptreact', 'typescript.tsx'
  },
  -- root_dir = function() return vim.loop.cwd() end
  root_dir = function(fname)
    return util.root_pattern 'tsconfig.json'(fname) or
             util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
  end
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
    signs = {severity_limit = "Hint"},
    virtual_text = {spacing = 1, prefix = '', severity_limit = "Warning"},
    underline = false,
    update_in_insert = false
  })

local signs = {Error = "", Warn = "", Hint = "", Info = ""}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
