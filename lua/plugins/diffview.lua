local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  use_icons = false,
  file_panel = {position = 'bottom', height = 10, listing_style = 'list'},
  file_history_panel = {position = 'bottom', height = 10},
  key_bindings = {
    disable_defaults = true,
    view = {["q"] = "<CMD>DiffviewClose<CR>", ["<C-n>"] = cb('toggle_files')},
    file_panel = {
      ["q"] = "<CMD>DiffviewClose<CR>",
      ["l"] = cb("select_entry"),
      ["<C-n>"] = cb('toggle_files')
    },
    file_history_panel = {
      ["q"] = "<CMD>DiffviewClose<CR>",
      ["l"] = cb("select_entry"),
      ["<C-n>"] = cb('toggle_files')
    }
  }
}
