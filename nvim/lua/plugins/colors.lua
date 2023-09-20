return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        local rose = require('rose-pine')
        rose.setup({disable_italics = true})
        vim.cmd.colorscheme("rose-pine")
    end,
  }
}
