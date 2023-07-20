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

  -- https://github.com/nvim-lualine/lualine.nvim
  -- 状态行
  { "nvim-lualine/lualine.nvim" },

  -- https://github.com/akinsho/bufferline.nvim
  -- 标签栏
  { "akinsho/bufferline.nvim", version = "*" },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- 语法高亮
  { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate' },
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

------------------------------------------------------------------------ Lualine
require('lualine').setup {
  options = {
    theme = 'onedark',
    fmt = string.lower,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}

--------------------------------------------------------------------- Bufferline
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

--------------------------------------------------------------------- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "python", "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<S-Tab>", -- 选择 
      node_incremental = "<Tab>", -- 递增
      node_decremental = "<S-Tab>", -- 递减
    },
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
  }
}
