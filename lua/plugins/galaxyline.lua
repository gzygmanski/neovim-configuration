local vim = vim
local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')
local lspclient = require('galaxyline.provider_lsp')
local icons = require('galaxyline.provider_fileinfo').define_file_icon()

-- get current file name
local function file_readonly()
  if vim.bo.filetype == 'help' then return '' end
  if vim.bo.readonly == true then return "  " end
  return ''
end

function get_current_file_name()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
  if vim.bo.modifiable then if vim.bo.modified then return '樂' .. file end end
  return file .. ' '
end

function get_cursor_pos()
  local r, c = unpack(vim.api.nvim_win_get_cursor(0))
  return string.format('%s : %s', r, c)
end

local colors = {
  -- polar night
  nord1 = '#2e3440',
  nord2 = '#3b4252',
  nord3 = '#434c5e',
  nord4 = '#4c566a',
  -- snow storm
  nord5 = '#d8dee9',
  nord6 = '#e5e9f0',
  nord7 = '#eceff4',
  -- frost
  nord8 = '#8fbcbb',
  nord9 = '#88c0d0',
  nord10 = '#81a1c1',
  nord11 = '#5e81ac',
  -- aurora
  nord12 = '#bf616a', -- red
  nord13 = '#d08770', -- orange
  nord14 = '#ebcb8b', -- yellow
  nord15 = '#a3be8c', -- green
  nord16 = '#b48ead' -- purple
}

icons['man'] = {colors.green, ''}

function condition.checkwidth()
  local squeeze_width = vim.fn.winwidth(0) / 2
  if squeeze_width > 50 then return true end
  return false
end

gls.left = {
  {
    Mode = {
      provider = function()
        local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c = 'COMMAND',
          V = 'VISUAL',
          [''] = 'VISUAL',
          t = 'TERMINAL',
          R = 'REPLACE'
        }
        if not condition.checkwidth() then
          alias = {
            n = 'N',
            i = 'I',
            c = 'C',
            V = 'V',
            [''] = 'V',
            t = 'T',
            R = 'R'
          }
        end
        return string.format('   %s  ', alias[vim.fn.mode()])
      end,
      highlight = {colors.nord6, colors.nord12, 'bold'}
    }
  }, {
    FillWhenEmptyBuffer = {
      provider = function() return '' end,
      highlight = {colors.nord6, colors.nord3}
    }
  }, {
    FileName = {
      provider = function()
        if #get_current_file_name() > 25 then
          return string.format('    %s…  ',
            string.sub(get_current_file_name(), 1, 25))
        end
        return string.format('    %s  ', get_current_file_name())
      end,
      condition = condition.buffer_not_empty,
      highlight = {colors.nord6, colors.nord3}
    }
  }, {
    GitBranch = {
      provider = function()
        if buffer.get_buffer_filetype() == '' then return end
        if vim.bo.filetype ~= 'help' then
          if not condition.checkwidth() then return '      ' end
          local git_branch = ''
          local status, retval = pcall(vcs.get_git_branch)
          if status then git_branch = retval end
          if #git_branch > 25 then
            return
              string.format('    %s…  ', string.sub(git_branch, 1, 25))
          else
            return string.format('    %s  ', git_branch)
          end
        end
      end,
      condition = function() return condition.check_git_workspace() end,
      highlight = {colors.nord6, colors.nord2}
    }
  }, {
    FillWhenEmptyBuffer = {
      provider = function() return '' end,
      highlight = {colors.nord6, colors.nord3}
    }
  }
}

gls.right = {
  {
    DiagnosticError = {
      provider = function()
        if next(vim.lsp.get_active_clients()) == nil then return '' end
        local active_clients = vim.lsp.get_active_clients()
        if active_clients then
          local numOfErrors = table.getn(
            vim.diagnostic.get(0, {severity = "error"}))
          if numOfErrors > 0 then
            return string.format('   E%s  ', numOfErrors)
          end
        end
      end,
      highlight = {colors.nord6, colors.nord12}
    }
  }, {
    LineInfo = {
      provider = function()
        return string.format('   ﱓ  %s  ', get_cursor_pos())
      end,
      highlight = {colors.nord6, colors.nord3}
    }
  }, {
    FileType = {
      provider = function()
        if buffer.get_buffer_filetype() == '' then
          return '     NONE  '
        end
        return string.format('     %s  ', buffer.get_buffer_filetype())
      end,
      highlight = {colors.nord6, colors.nord2}
    }
  }, {
    Blank = {
      provider = function() return '  ' end,
      highlight = {colors.nord6, colors.nord3}
    }
  }
}

gl.short_line_list = {'NvimTree', 'DiffviewFiles'}
gls.short_line_left = {
  {
    BufferName = {
      provider = function()
        if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
          local filetype = vim.bo.filetype
          if filetype == 'NvimTree' then return '     Explorer  ' end
          if filetype == 'DiffviewFiles' then
            return '     Diffview  '
          end
        else
          if fileinfo.get_current_file_name() ~= '' then
            return string.format('    %s  ', get_current_file_name())
          else
            return '   ﬘  buffer  '
          end
        end
      end,
      separator = '',
      highlight = {colors.nord6, colors.nord3}
    }
  }
}
