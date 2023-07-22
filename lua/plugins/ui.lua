return {
    {   -- https://github.com/folke/tokyonight.nvim -- 配色方案
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]] -- night, storm, day, moon
        end    
    },

    {   -- https://github.com/nvim-lualine/lualine.nvim -- 状态栏
        "nvim-lualine/lualine.nvim",
        dependencies = {
            -- https://github.com/nvim-tree/nvim-web-devicons -- 图标
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require('lualine').setup {
                options = {
                    theme = "tokyonight",
                    fmt = string.lower,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                }
            }
        end
    },

    {   -- https://github.com/utilyre/barbecue.nvim
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            -- https://github.com/SmiteshP/nvim-navic
            "SmiteshP/nvim-navic"
        },
        config = function()
            require('barbecue').setup {
                options = {
                    theme = "tokyonight",
                }
            }
        end
    },

    {   -- https://github.com/akinsho/bufferline.nvim -- 标签栏
        "akinsho/bufferline.nvim",
        version = "*",
        config = function()
            require('bufferline').setup {
                options = {
                    mode = "buffers",
                    number = "ordinal", -- buffer_id,ordinal,both
                    offsets = {
                        { filetype = 'NvimTree' }
                    },
                },
                highlights = {
                    buffer_selected = {
                        italic = false
                    },
                    indicator_selected = {
                        fg = {
                            attribute = 'fg',
                            highlight = 'Function'
                        },
                        italic = false
                    }
                }
            }
        end
    },

    {   -- https://github.com/lukas-reineke/indent-blankline.nvim -- 缩进线
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                indentLine_enabled = 1,
                char = '┊',
                -- char = '',
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
    },

    {   -- https://github.com/lewis6991/gitsigns.nvim
        "lewis6991/gitsigns.nvim",
        config = function() 
            require("gitsigns").setup()
        end
    }
}
