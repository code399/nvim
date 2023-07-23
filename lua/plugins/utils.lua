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

    },

    {   -- https://github.com/folke/flash.nvim -- 光标跳转
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            local map = vim.keymap.set
            local flash = require("flash")  
            flash.setup()
            map( { "n", "x", "o" }, "s", function() flash.jump() end, {desc = "Flash"} )
            map( { "n", "o", "x" }, "S", function() flash.treesitter() end, {desc = "Flash Treesitter"} )
            map( "o", "r", function() flash.remote() end, {desc = "Remote Flash"} )
            map( { "o", "x" }, "R", function() flash.treesitter_search() end, {desc = "Treesitter Search"} )
            map( { "c" }, "<c-s>", function() flash.toggle() end, {desc = "Toggle Flash Search"} )
        end
    },

    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
        config = function()
            require('glow').setup()
        end
    },

    {   -- https://github.com/nvim-neo-tree/neo-tree.nvim -- 文件资源管理器
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup()
            vim.keymap.set({"n", "v"}, "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Neo tree"})
        end
    },

    {   -- https://github.com/max397574/better-escape.nvim
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup {
                mapping = {"kk", "jj"},
                timeout = vim.o.timeoutlen,
                clear_empty_lines = false,
                keys = "<Esc>"
            }
        end
    },

    {   -- https://github.com/echasnovski/mini.comment -- 注释
        'echasnovski/mini.comment',
        version = false,
        config = function()
            require("mini.comment").setup()
        end
    },

    {   -- https://github.com/folke/which-key.nvim -- 自定义功能键提示
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    }
}
