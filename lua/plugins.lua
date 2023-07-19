local plugins = {
  -- https://github.com/nvim-tree/nvim-web-devicons
  { "nvim-tree/nvim-web-devicons" },
  
  -- https://github.com/tpope/vim-sleuth
  -- 自动检测制表符和缩进宽度
  { "tpope/vim-sleuth" },

  -- https://github.com/navarasu/onedark.nvim
  -- 配色方案
  { "navarasu/onedark.nvim", lazy = false, priority = 1000 },

  -- https://github.com/max397574/better-escape.nvim
  -- ESC 键替换方案
  { "max397574/better-escape.nvim" },

}

--------------------------------------------------------------------------- Lazy
-- https://github.com/folke/lazy.nvim
-- 插件管理器 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup (plugins)

-------------------------------------------------------------------- Colorscheme
require('onedark').setup { style = 'dark' }
-- dark,darker,cool,deep,warm,warmer,light

vim.cmd('colorscheme onedark')

------------------------------------------------------------------ Better escape
require("better_escape").setup {
  mapping = {"kk", "jj"},
  timeout = vim.o.timeoutlen,
  clear_empty_lines = false,
  keys = "<Esc>"
}
