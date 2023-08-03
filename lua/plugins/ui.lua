return {
    { -- https://github.com/folke/tokyonight.nvim -- 配色方案
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight-storm]] -- night, storm, day, moon
        end
    },

    { -- https://github.com/nvim-lualine/lualine.nvim -- 状态栏
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
                    -- component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                }
            }
        end
    },

    { -- https://github.com/utilyre/barbecue.nvim -- Like winbar
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
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

    { -- https://github.com/akinsho/bufferline.nvim -- 标签栏
        "akinsho/bufferline.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require('bufferline').setup {
                options = {
                    mode = "buffers",
                    -- numbers = "both", -- buffer_id,ordinal,both
                    offsets = {
                        {
                            filetype = "NvimTree",
                            separator = true,
                        },
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

    { -- https://github.com/lukas-reineke/indent-blankline.nvim -- 缩进线
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            require("indent_blankline").setup {
                indentLine_enabled = 1,
                -- char = '┊',
                -- -- char = '',
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

    { -- https://github.com/lewis6991/gitsigns.nvim -- 显示 git 后的代码变化
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end
    },

    { -- https://github.com/goolord/alpha-nvim -- 开始菜单
        "goolord/alpha-nvim",
        config = function()
            local alpha = require 'alpha'
            local dashboard = require 'alpha.themes.dashboard'
            dashboard.section.header.val = {
                [[                               __                ]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            }
            dashboard.section.buttons.val = {
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("SPC f f", "  Find file"),
                dashboard.button("SPC f g", "  Live grep"),
                dashboard.button("SPC f e", "  File explorer"),
                dashboard.button("SPC f o", "󰈢  Recently opened files"),
                dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
            }
            local handle = io.popen('fortune')
            local fortune = handle:read("*a")
            handle:close()
            dashboard.section.footer.val = fortune

            dashboard.config.opts.noautocmd = true

            vim.cmd [[autocmd User AlphaReady echo 'ready']]

            alpha.setup(dashboard.config)
        end
    }
}
