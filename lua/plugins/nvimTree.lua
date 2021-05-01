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
-- vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)

vim.g.nvim_tree_icons = {
  default = '   ',
  symlink = '   ',
  folder = {
    default = "   ",
    open = "  ﱮ ",
    empty = "   ",
    empty_open = "  ﱮ ",
    symlink = "   ",
  }
}
   
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"] = ":YourVimFunction()<cr>",
  ["u"] = ":lua require'some_module'.some_function()<cr>",

  -- default mappings
  ["<CR>"] = tree_cb("cd"),
  ["<BS>"] = tree_cb("dir_up"),
  ["e"] = tree_cb("edit"),
  ["l"] = tree_cb("edit"),
  ["v"] = tree_cb("vsplit"),
  ["s"] = tree_cb("split"),
  ["t"] = tree_cb("tabnew"),
  ["h"] = tree_cb("close_node"),
  ["<Tab>"] = tree_cb("close"),
  ["<Esc>"] = tree_cb("close"),
}
-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
