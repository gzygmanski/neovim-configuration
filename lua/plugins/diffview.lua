local actions = require("diffview.actions")

require("diffview").setup({
  use_icons = false,
  enhanced_diff_hl = true,
  file_panel = {
    win_config = {position = 'bottom', height = 10},
    listing_style = 'list'
  },
  file_history_panel = {win_config = {position = 'bottom', height = 10}},
  key_bindings = {
    disable_defaults = true,
    view = {
      ["q"] = "<CMD>DiffviewClose<CR>", 
      ["<C-n>"] = actions.toggle_files
    },
    file_panel = {
      ["q"] = "<CMD>DiffviewClose<CR>",
      ["l"] = actions.select_entry,
      ["<C-n>"] = actions.toggle_files
    },
    file_history_panel = {
      ["q"] = "<CMD>DiffviewClose<CR>",
      ["l"] = actions.select_entry,
      ["<C-n>"] = actions.toggle_files
    }
  }
})
