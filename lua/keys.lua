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
map('n',
    '<leader>|',
    ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>',
    { desc = "Toggle colorcolumn" }
)

-- -- Navigate buffers
map('n', '<S-tab>', '<cmd> bprevious<CR>', {desc = "Previous buffer"})
map('n', '<tab>', '<cmd> bnext<CR>', {desc = "Next buffer"})
-- map('n', '<leader>bf', '<cmd> bfirst<CR>', {desc = "First buffer"})
-- map('n', '<leader>bl', '<cmd> blast<CR>', {desc = "Last buffer"})
map('n', '<leader>x', '<cmd> bdelete<CR>', {desc = "Delete buffer"})


-- map('n', "<leader>o", ":SymbolsOutline<CR>", { desc = "Toggle outline" });
map('n', "<F5>", "<cmd> !cargo run<CR>", { desc = "Cargo run" });
map('n', "<F6>", "<cmd> !cargo check<CR>", { desc = "Cargo check" });
