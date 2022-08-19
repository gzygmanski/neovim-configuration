local style = {}

local borderchars = {
  {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
  prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
  results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
  preview = {'─', '│', '─', '│', '┌', '┐', '┘', '└'}
}

style.no_preview = {
  borderchars = borderchars,
  prompt_title = false,
  previewer = false,
  layout_config = {width = 120, height = .8}
}

style.preview = {
  borderchars = borderchars,
  prompt_title = false,
  layout_config = {width = 120, height = .8}
}

return style
