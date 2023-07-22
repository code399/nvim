vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 复制后高亮提示
-- See `:help vim.highlight.on_yank()`
local h = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd(
  'TextYankPost',
  {
    callback = function()
      vim.highlight.on_yank({timeout = 300})
    end,
    group = h,
    pattern = '*',
  }
)

require("option")
require("keymap")
require("plugin")
