 -- https://github.com/navarasu/onedark.nvim
 -- 配色方案
return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup {
                style = "dark", -- dark,darker,cool,deep,warm,warmer,light
            }
            require('onedark').load()
        end
    }
}
