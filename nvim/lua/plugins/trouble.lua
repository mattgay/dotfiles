return {
  {
    'folke/trouble.nvim',
    requires = "nvim-tree/nvim-web-devicons",
    keys = {
      { '<leader>xq' },
    },
    config = function() 
      local trouble = require("trouble") 

      trouble.setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
          -- refer to the configuration section below
      }

      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        {silent = true, noremap = true}
      )
      
    end,
  }
}
