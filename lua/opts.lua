vim.opt.mouse = "a"               -- 启用鼠标
vim.opt.clipboard = "unnamedplus" -- 打通剪贴板
vim.opt.termguicolors = true      -- 真彩（24位颜色）
-- vim.opt.guifont = "Hack Nerd Font Mono:h15" -- 英文字体
-- vim.o.guifontwide = "Yahei Mono:h11" -- 中文字体
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = true         -- 允许隐藏被修改过的buffer
vim.opt.autoread = true       -- 当文件被外部程序修改时自动加载
vim.opt.number = true         -- 绝对行号
vim.opt.relativenumber = true -- 相对行号（组合为混合相对行号）
vim.opt.signcolumn = "yes"    -- 显示左侧标志指示列
vim.opt.colorcolumn = "81"    -- 显示右侧参考线
vim.opt.cursorline = true     -- 高亮光标所在行
vim.opt.syntax = "false"      -- 启用语法高亮
vim.opt.cmdheight = 1         -- 命令行高为1
vim.opt.showtabline = 2       -- 始终显示 tabline
vim.opt.laststatus = 2        -- 始终显示状态行
-- vim.opt.list = true -- 显示不可见字符
-- vim.opt.listchars:append "eol:↴" -- 显示行尾回车符
-- vim.opt.listchars:append "space:⋅" -- 显示空格符
vim.opt.wrap = true               -- 自动换行
vim.opt.breakindent = true        -- 自动换行对齐
vim.opt.linebreak = true          -- 整词换行
-- vim.opt.showbreak = '>>>' -- 自动换行标记
vim.opt.undofile = true           -- 保存撤销历史记录
vim.opt.history = 1000            -- 历史命令最多保存1000条
vim.opt.whichwrap:append "<>[]hl" -- 光标可以从行尾移动到下行首，反之亦然。
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 400
vim.opt.wildmenu = false -- cmd 建议菜单
vim.opt.showmode = false -- 禁用模式显示
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Splits
vim.opt.splitbelow = true -- 新窗口置于当前窗口的下边
vim.opt.splitright = true -- 新窗口置于当前窗口的右边

-- Whitespace & Indent
vim.opt.expandtab = true  -- Tab字符转换为空格
vim.opt.tabstop = 4       -- Tab字符的宽度
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4    -- 缩进宽度
vim.opt.shiftround = true -- 缩进时取 shiftwidth 整数
vim.opt.autoindent = true -- 新行自动缩进对齐当前行
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true -- 搜索大小写不敏感，除非搜索输入包含大写
vim.opt.smartcase = true  -- 若搜索关键字中包含大写字符，则搜索大小写敏感
vim.opt.incsearch = true  -- 边输入边搜索
vim.opt.hlsearch = true   -- 搜索匹配高亮

-- Filetypes
vim.opt.encoding = 'utf8'
vim.opt.fileencoding = 'utf8'

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
