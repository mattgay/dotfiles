return {
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>=" }
        },
        config = function()
            require("go").setup({
                lsp_inlay_hints = { enable = false, },
                trouble = true,
            })

            vim.keymap.set('n', '<leader>+', require('go.format').goimport, {})
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    }
}
