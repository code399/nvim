-- https://github.com/lukas-reineke/indent-blankline.nvim
  -- 缩进线
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                indentLine_enabled = 1,
                -- char = '┊',
                char = '',
                filetype_exclude = {
                    "help",
                    "terminal",
                    "lazy",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "mason",
                    "nvdash",
                    "nvcheatsheet",
                    "",
                },
                -- 空行显示缩进线
                show_trailing_blankline_indent = false,
                -- 在第一列显示缩进线
                show_first_indent_level = true,
                -- 突出显示当前行缩进级别
                show_current_context = true,
                show_current_context_start = true,
                -- 使用 treesitter 确定缩进线位置
                use_treesitter = true,
            }
        end
    }
}
