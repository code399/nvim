
return {
    {   -- https://github.com/nvim-tree/nvim-tree.lua -- 文件资源管理器
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup {
                hijack_cursor = true, -- 光标保持在文件名的第一个字母上
                sync_root_with_cwd = true, -- 同步（工作）根目录
                git = { enable = false }, -- 禁用 Git 集成的图标和颜色
                actions = {
                    open_file = { quit_on_open = true } -- 打开文件后关闭 nvim-tree
                },
                renderer = {
                    full_name = true,
                    root_folder_label = ":~:s?$?/..?", -- 根目录显示方式
                    special_files = {} -- 高亮显示文件列表
                }
            }
        end
    }
}
