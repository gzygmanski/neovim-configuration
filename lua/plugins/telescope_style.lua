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
  previewer = false
}

style.preview = {borderchars = borderchars, prompt_title = false}

return style
