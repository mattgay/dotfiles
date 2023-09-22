return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      { "<leader>pp" },
      { "<leader>po" },
      { "<leader>pg" },
      { "<leader>ph" },
      { "<leader>ps" },
      { "<leader>pC" },
      { "<leader>pV" },
      { "<leader>pG" },
      { "<Tab>" },
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        pickers = {
          buffers      = {
            initial_mode = "normal",
            sort_mru = true,
            ignore_current_buffer = true,
            mappings = {
              n = {
                ['<c-b>'] = 'delete_buffer',
              }
            }
          },
          git_bcommits = {
            initial_mode = "normal",
          },
          git_commits  = {
            initial_mode = "normal",
          },
          git_status  = {
            initial_mode = "normal",
          },
          grep_string  = {
            initial_mode = "normal",
          }
        },

      })
      telescope.load_extension('fzf')



      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>pp', builtin.resume, {})
      vim.keymap.set('n', '<leader>po', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
      vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, {})
      vim.keymap.set('n', '<leader>pV', builtin.git_commits, {})
      vim.keymap.set('n', '<leader>pG', builtin.git_status, {})

      vim.keymap.set('n', '<Tab>', builtin.buffers, {})
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}
