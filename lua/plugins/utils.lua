return {
    {   -- https://github.com/windwp/nvim-autopairs -- 成双配对
        "windwp/nvim-autopairs",
        config = function()
            require 'nvim-autopairs'.setup({
                enable_check_bracket_line = true
            }) 
        end
    },

    {   -- https://github.com/ethanholz/nvim-lastplace -- 记住文件退出时光标位置
        "ethanholz/nvim-lastplace",
        config = function()
            require 'nvim-lastplace'.setup() 
        end

    }
}
