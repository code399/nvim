-- https://github.com/akinsho/bufferline.nvim
-- 标签栏
return {
    {
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
    }
}
