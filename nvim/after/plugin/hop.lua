require'hop'.setup()

local hop = require('hop')
vim.keymap.set('', '<Leader>w', function() hop.hint_words() end)

local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader>f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<leader>F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', '<leader>t', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', '<leader>T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})
