local actions = require('telescope.actions')
local telescope = require('telescope')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-f>"] = actions.close,
        ["<C-s>"] = actions.file_split,
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = 'bottom',
    prompt_prefix = ' ',
    selection_caret = ' ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'vertical',
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.65,
    preview_cutoff = 120,
    results_height = 0.5,
    results_width = 0.5,
    border = {},
    borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
    color_devicons = false,
    use_less = false,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  }
}

telescope.load_extension('fzy_native')
