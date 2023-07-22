-- https://github.com/nvim-lualine/lualine.nvim
-- 状态行
return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'onedark',
                    fmt = string.lower,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                }
            }
        end
    }
}
