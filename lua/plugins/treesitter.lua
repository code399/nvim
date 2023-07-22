-- https://github.com/nvim-treesitter/nvim-treesitter
-- 语法高亮
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "lua", "rust", "toml" },
                auto_install = true,
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<S-Tab>", -- 选择 
                        node_incremental = "<Tab>", -- 递增
                        node_decremental = "<S-Tab>", -- 递减
                    },
                },
                ident = { enable = true }, 
                rainbow = { enable = true }
            }
        end
    }
}
