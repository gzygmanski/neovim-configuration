vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 37
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 0}
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_disable_default_keybindings = 1
vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

vim.g.nvim_tree_icons = {
  default = '   ',
  symlink = '   ',
  folder = {
    default = "   ",
    open = "  ﱮ ",
    empty = "   ",
    empty_open = "  ﱮ ",
    symlink = "   "
  }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
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
  {key = "g?", cb = tree_cb("toggle_help")}
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
