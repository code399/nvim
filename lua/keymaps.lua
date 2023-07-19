local map = vim.keymap.set

-- 禁用方向键
map({ "n", "i", "v" }, "<Up>", "<Nop>")
map({ "n", "i", "v" }, "<Down>", "<Nop>")
map({ "n", "i", "v" }, "<Left>", "<Nop>")
map({ "n", "i", "v" }, "<Right>", "<Nop>")

-- 按逻辑行上下移动光标
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Toggle colored column at 81
map('n', '<leader>|', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>', {desc = "Toggle colorcolumn"})

-- Navigate buffers
map('n', '<leader>bp', '<cmd> bprevious<CR>', {desc = "Previous buffer"})
map('n', '<leader>bn', '<cmd> bnext<CR>', {desc = "Next buffer"})
map('n', '<leader>bf', '<cmd> bfirst<CR>', {desc = "First buffer"})
map('n', '<leader>bl', '<cmd> blast<CR>', {desc = "Last buffer"})
map('n', '<leader>bd', '<cmd> bdelete<CR>', {desc = "Delete buffer"})


-- Telescope
map('n', "<leader>/", "<cmd> Telescope current_buffer_fuzzy_find<CR>", {desc = "Fuzzily search in current buffer"})
map('n', "<leader>fo", "<cmd> Telescope oldfiles<CR>", {desc = "Find oldfiles"})
map('n', "<leader>fb", "<cmd> Telescope buffers<CR>", {desc = "Find existing buffers"})
map('n', "<leader>ff", "<cmd> Telescope find_files<CR>", {desc = "Find files"})
map('n', "<leader>fg", "<cmd> Telescope live_grep<CR>", {desc = "Live grep"})
map('n', "<leader>fh", "<cmd> Telescope help_tags<CR>", {desc = "Help page"})
      
-- Nvim Tree
map("n", "<leader>n", "<cmd> NvimTreeToggle<CR>", {desc = "Toggle nvimtree"})

map('n', "<leader>o", ":SymbolsOutline<CR>", {desc = "Toggle outline"});

-- Hop
map("n", "<leader>hw", "<cmd> HopWord<cr>", {desc = "HopWord"})
map("n", "<leader>hp", "<cmd> HopPattern<cr>", {desc = "HopPattern"})
map("n", "<leader>hl", "<cmd> HopLineStart<cr>", {desc = "HopLineStart"})
map("n", "<leader>ha", "<cmd> HopAnywhere<cr>", {desc = "HopAnywhere"})

map("n", "<leader>t", "<cmd> TroubleToggle<cr>", {desc = "Toggle trouble list"})

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
