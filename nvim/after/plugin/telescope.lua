local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gC', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

vim.keymap.set('n', '<Tab>', builtin.buffers, {})

require('telescope').setup{
  pickers = {
    buffers = {
      initial_mode = "normal",
      sort_mru = true,
      ignore_current_buffer = true,
      mappings = {
        n = {
            ['<c-d>'] = 'delete_buffer',
        }}
    },
    git_bcommits  = {
        initial_mode = "normal",
    },
    git_commits  = {
        initial_mode = "normal",
    }
  }}
