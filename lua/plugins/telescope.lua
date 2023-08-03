return {
    { -- https://github.com/nvim-telescope/telescope.nvim -- 模糊搜索
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",

        dependencies = {
            -- https://github.com/nvim-lua/plenary.nvim
            "nvim-lua/plenary.nvim",
            -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        keys = {
            { -- 当前目录下文件名中搜索
                '<leader>ff',
                "<cmd>lua require('telescope.builtin').find_files()<CR>",
                desc = "Find files"
            },
            { -- 当前目录下文件中搜索
                '<leader>fg',
                "<cmd>lua require('telescope.builtin').live_grep()<CR>",
                desc = "Live grep"
            },
            { -- 当前打开的 buffer 名中搜索
                '<leader>fb',
                "<cmd>lua require('telescope.builtin').buffers()<CR>",
                desc = "Find existing buffers"
            },
            { -- 帮助页中搜索
                '<leader>fh',
                "<cmd>lua require('telescope.builtin').help_tags()<CR>",
                desc = "Help page"
            },
            { -- 曾经打开过的文件名中搜索
                "<leader>fo",
                "<cmd>lua require('telescope.builtin').oldfiles()<CR>",
                desc = "Find recently opened files"
            },
            { -- 当前 buffer 内容中搜索
                "<leader>/",
                function()
                    require('telescope.builtin').current_buffer_fuzzy_find(
                        require('telescope.themes').get_dropdown {
                            winblend = 10,
                            previewer = false,
                        }
                    )
                end,
                desc = "Fuzzily search in current buffer"
            },
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    prompt_prefix = "   ", -- 搜索框提示符 Default: "> "
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                        -- the default case_mode is "smart_case"
                        -- or "ignore_case" or "respect_case"
                    }
                }
            }
            require('telescope').load_extension('fzf')
        end
    }
}
