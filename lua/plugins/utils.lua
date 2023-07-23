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
            -- map({"n", "x", "o"}, "s", function()
            --     flash.jump({
            --         search = {
            --             mode = function(str)
            --                 return "\\<" .. str
            --             end
            --         },
            --     })
            -- end, {}
            map( { "n", "x", "o" }, "s", function() flash.jump() end, {desc = "Flash"} )
            map( { "n", "o", "x" }, "S", function() flash.treesitter() end, {desc = "Flash Treesitter"} )
            map( "o", "r", function() flash.remote() end, {desc = "Remote Flash"} )
            map( { "o", "x" }, "R", function() flash.treesitter_search() end, {desc = "Treesitter Search"} )
            map( { "c" }, "<c-s>", function() flash.toggle() end, {desc = "Toggle Flash Search"} )
        end
    }
}
