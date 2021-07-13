local actions = require('telescope.actions')
local telescope = require('telescope')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-s>"] = actions.file_split
      }
    },
    prompt_title = false,
    prompt_prefix = ' ',
    previewer = false,
    selection_caret = ' ',
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'bottom',
      width = 0.65,
      preview_cutoff = 120,
      results_height = 0.5,
      results_width = 0.5
    },
    borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
    color_devicons = false,
    file_ignore_patterns = {'node_modules/.*'},
    use_less = false
  }
}

telescope.load_extension('fzy_native')
