local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list = {
  {key = {"e"}, cb = tree_cb("edit")}, {key = {"l"}, cb = tree_cb("edit")},
  {key = {"<CR>"}, cb = tree_cb("cd")}, {key = "v", cb = tree_cb("vsplit")},
  {key = "s", cb = tree_cb("split")}, {key = "t", cb = tree_cb("tabnew")},
  {key = "<", cb = tree_cb("prev_sibling")},
  {key = ">", cb = tree_cb("next_sibling")},
  {key = "P", cb = tree_cb("parent_node")},
  {key = "h", cb = tree_cb("close_node")},
  {key = "K", cb = tree_cb("first_sibling")},
  {key = "J", cb = tree_cb("last_sibling")},
  {key = "I", cb = tree_cb("toggle_ignored")},
  {key = "H", cb = tree_cb("toggle_dotfiles")},
  {key = "R", cb = tree_cb("refresh")}, {key = "a", cb = tree_cb("create")},
  {key = "d", cb = tree_cb("remove")}, {key = "r", cb = tree_cb("rename")},
  {key = "<C-r>", cb = tree_cb("full_rename")},
  {key = "x", cb = tree_cb("cut")}, {key = "c", cb = tree_cb("copy")},
  {key = "p", cb = tree_cb("paste")}, {key = "y", cb = tree_cb("copy_name")},
  {key = "Y", cb = tree_cb("copy_path")},
  {key = "gy", cb = tree_cb("copy_absolute_path")},
  {key = "[c", cb = tree_cb("prev_git_item")},
  {key = "]c", cb = tree_cb("next_git_item")},
  {key = "<BS>", cb = tree_cb("dir_up")}, {key = "q", cb = tree_cb("close")},
  {key = "W", cb = tree_cb("collapse_all")},
  {key = "?", cb = tree_cb("toggle_help")}
}

vim.g.nvim_tree_width_allow_resize = 1

require'nvim-tree'.setup {
  hijack_cursor = false,
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  view = {
    width = 40,
    side = 'left',
    mappings = {custom_only = true, list = list}
  },
  diagnostics = {
    enable = false,
    icons = {error = "", warning = "", hint = "", info = ""}
  },
  renderer = {
    root_folder_modifier = ':~',
    indent_markers = {enable = false},
    highlight_git = true,
    highlight_opened_files = 'none',
    special_files = {},
    icons = {
      show = {git = false, folder = true, file = true, folder_arrow = false},
      padding = '  ',
      git_placement = 'after',
      glyphs = {
        default = '  ',
        symlink = '  ',
        folder = {
          default = "  ",
          open = "  ﱮ",
          empty = "  ",
          empty_open = "  ﱮ",
          symlink = "  ",
          symlink_open = "  "
        },
        git = {
          unstaged = "-",
          staged = "+",
          unmerged = "!",
          renamed = "r",
          untracked = "?",
          deleted = "x",
          ignored = ""
        }
      }
    }
  },
  filters = {dotfiles = false},
  git = {enable = true, ignore = true},
  actions = {
    open_file = {resize_window = false},
    remove_file = {close_window = false}
  }
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
