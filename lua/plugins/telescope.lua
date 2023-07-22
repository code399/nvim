-- https://github.com/nvim-telescope/telescope.nvim
-- 模糊搜索
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- https://github.com/nvim-lua/plenary.nvim
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup {
                defaults = {
                    prompt_prefix = "   ", -- 搜索框提示符 Default: "> "
                }
            }
        end
    }
}
