-- https://github.com/nvim-treesitter/nvim-treesitter
-- 语法高亮
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "python", "lua", "rust", "toml", "markdown", "markdown_inline" },
                auto_install = true,
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<S-Tab>",   -- 选择
                        node_incremental = "<Tab>",   -- 递增
                        node_decremental = "<S-Tab>", -- 递减
                    },
                },
                indent = { enable = true },
                rainbow = { enable = true }
            }
        end
    }
}
