return {
    { -- https://github.com/windwp/nvim-autopairs -- 成双配对
        "windwp/nvim-autopairs",
        enent = "InsertEnter",
        config = function()
            require 'nvim-autopairs'.setup({
                enable_check_bracket_line = true, -- 关闭对'}])'前不自动配对
                ignored_next_char = "[%w%.]",     -- 字母,数字,'.'前不自动配对
            })
        end
    },

    { -- https://github.com/ethanholz/nvim-lastplace -- 记住文件退出时光标位置
        "ethanholz/nvim-lastplace",
        config = function()
            require 'nvim-lastplace'.setup()
        end
    },

    { -- https://github.com/folke/flash.nvim -- 光标跳转
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash"
            },
            {
                "S",
                mode = { "n", "o", "x" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search"
            },
        },
        config = function()
            require("flash").setup()
        end
    },

    { -- https://github.com/ellisonleao/glow.nvim -- Markdown 预览
        "ellisonleao/glow.nvim",
        event = "VeryLazy",
        cmd = "Glow",
        config = function()
            require('glow').setup()
        end
    },

    { -- https://github.com/nvim-tree/nvim-tree.lua -- 文件资源管理器
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<leader>e", "<cmd> NvimTreeToggle<CR>", desc = "Toggle nvimtree" },
        },
        config = function()
            require("nvim-tree").setup {
                hijack_cursor = true,      -- 光标保持在文件名的第一个字母上
                sync_root_with_cwd = true, -- 同步（工作）根目录
                git = {
                    enable = false         -- 禁用 Git 集成的图标和颜色
                },
                actions = {
                    open_file = {
                        quit_on_open = true -- 打开文件后关闭 nvim-tree
                    }
                },
                renderer = {
                    full_name = true,
                    root_folder_label = ":~:s?$?/..?", -- 根目录显示方式
                    special_files = {}                 -- 高亮显示文件列表
                }
            }
        end
    },
    -- { -- https://github.com/nvim-neo-tree/neo-tree.nvim -- 文件资源管理器
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim",
    --     },
    --     config = function()
    --         require("neo-tree").setup()
    --         vim.keymap.set({ "n", "v" }, "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Neo tree" })
    --     end
    -- },

    { -- https://github.com/max397574/better-escape.nvim -- Esc 键替换
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup {
                mapping = { "kk", "jj" },
                timeout = vim.o.timeoutlen,
                clear_empty_lines = false,
                keys = "<Esc>"
            }
        end
    },

    { -- https://github.com/echasnovski/mini.comment -- 注释
        'echasnovski/mini.comment',
        event = "VeryLazy",
        version = false,
        config = function()
            require("mini.comment").setup()
        end
    },

    { -- https://github.com/folke/which-key.nvim -- 自定义功能键提示
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    }
}
