-- https://github.com/nvim-telescope/telescope.nvim
-- 模糊搜索
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        -- https://github.com/nvim-lua/plenary.nvim
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    prompt_prefix = "   ", -- 搜索框提示符 Default: "> "
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
                    }
                }
            }
            require('telescope').load_extension('fzf')
            local builtin = require('telescope.builtin')
            local map = vim.keymap.set
            map('n', '<leader>ff', builtin.find_files, {desc = "Find files"})
            map('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
            map('n', '<leader>fb', builtin.buffers, {desc = "Find existing buffers"})
            map('n', '<leader>fh', builtin.help_tags, {desc = "Help page"})
            map('n', "<leader>fo", builtin.oldfiles, {desc = "Find recently opened files"})
            -- map('n', "<leader>/", builtin.current_buffer_fuzzy_find, {desc = "Fuzzily search in current buffer"})
            map('n', "<leader>/", function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, {desc = "Fuzzily search in current buffer"})
        end
    }
}
