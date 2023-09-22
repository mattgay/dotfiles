return {
    {
        'folke/trouble.nvim',
        requires = "nvim-tree/nvim-web-devicons",
        keys = {
            { '<leader>x' },
            { '<leader>gr' },
        },
        config = function()
            local trouble = require("trouble")

            trouble.setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }

            vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
            vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
            vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
            vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
            vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
            vim.keymap.set("n", "gr", function() require("trouble").open("lsp_references") end)
        end,
    }
}
