return {
    { -- https://github.com/nvim-treesitter/nvim-treesitter -- 语法高亮
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "c",
                    "lua",
                    "rust",
                    "toml",
                    "python",
                    "markdown",
                    "markdown_inline"
                },
                auto_install = true,
                highlight = { enable = true },
                incremental_selection = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            }
        end
    }
}
