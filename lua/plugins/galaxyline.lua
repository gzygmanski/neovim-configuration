local vim = vim
local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('galaxyline.provider_fileinfo')
local diagnostic = require('galaxyline.provider_diagnostic')
local lspclient = require('galaxyline.provider_lsp')
local icons = require('galaxyline.provider_fileinfo').define_file_icon()

-- get current file name
local function file_readonly()
  if vim.bo.filetype == 'help' then
    return ''
  end
  if vim.bo.readonly == true then
    return "  "
  end
  return ''
end

function get_current_file_name()
  local file = vim.fn.expand('%:t')
  if vim.fn.empty(file) == 1 then return '' end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return '樂' .. file 
    end
  end
  return file .. ' '
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
    nord16 = '#b48ead', -- purple
}

icons['man'] = {colors.green, ''}

function condition.checkwidth()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 50 then
    return true
  end
    return false
end

gls.left = {
    {
        Mode = {
            provider = function()
                local alias = {n = 'NORMAL', i = 'INSERT', c = 'COMMAND', V= 'VISUAL', [''] = 'VISUAL'}
                if not condition.checkwidth() then
                    alias = {n = 'N', i = 'I', c = 'C', V= 'V', [''] = 'V'}
                end
                return string.format('   %s  ', alias[vim.fn.mode()])
                --  
            end,
            highlight = {colors.nord6, colors.nord12, 'bold'},
        }
    },
    {
        FillWhenEmptyBuffer = {
            provider = function() return '' end,
            highlight = {colors.nord6, colors.nord3}
        }
    },
    {
        FileName = {
            provider = function()
              return string.format('   %s', get_current_file_name())
            end,
            condition = condition.buffer_not_empty,
            highlight = {colors.nord6, colors.nord3}
        }
    },
    -- {
    --     GitBranch = {
    --         provider = function() 
    --           if vim.bo.filetype ~= 'help' then
    --             return string.format('   %s ', vcs.get_git_branch()) 
    --           end
    --         end,
    --         -- provider = function() return string.format('  %s ', vcs.get_git_branch()) end,
    --         condition = function() return condition.check_git_workspace() and condition.checkwidth() end,
    --         highlight = {colors.nord6, colors.nord3}
    --     }
    -- },
}

gls.right = {
    {
        Blank = {
            provider = function() return '   ' end,
            condition = function() return buffer.get_buffer_filetype() ~= '' end,
            highlight = {colors.nord6, colors.nord2}
        }
    },
    {
        FileIcon = {
            provider = fileinfo.get_file_icon,
            condition = function() return buffer.get_buffer_filetype() ~= '' end,
            highlight = {
                colors.nord6,
                colors.nord2
            },
        },
    },
    {
        FileType = {
            provider = function() return string.format('  %s  ', buffer.get_buffer_filetype()) end,
            condition = function() return buffer.get_buffer_filetype() ~= '' end,
            highlight = {colors.nord6, colors.nord2}
        }
    },
    {
        LineInfo = {
            provider = function() return string.format('   %s  ', fileinfo.line_column()) end,
            highlight = {colors.nord6, colors.nord4}
        }
    },
}

gl.short_line_list = {'NvimTree'}
gls.short_line_left = {
    {
        BufferName = {
            provider = function()
                if vim.fn.index(gl.short_line_list, vim.bo.filetype) ~= -1 then
                    local filetype = vim.bo.filetype
                    if filetype == 'NvimTree' then
                        return '     Explorer  '
                    end
                else
                    if fileinfo.get_current_file_name() ~= '' then
                        return string.format('   %s ', get_current_file_name())
                    else
                        return '   Buffer  '
                    end
                end
            end,
            separator = '',
            highlight = {colors.nord6, colors.nord3}
        }
    },
    -- {
    --     FillWhenEmptyBuffer = {
    --         provider = function() return '' end,
    --         condition = not condition.buffer_not_empty,
    --         highlight = {colors.nord6, colors.nord3}
    --     }
    -- },
}
