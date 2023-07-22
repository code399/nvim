-- https://github.com/windwp/nvim-autopairs
-- 成双配对
return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require 'nvim-autopairs'.setup() 
        end
    }
}
