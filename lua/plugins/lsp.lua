return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "simrat39/rust-tools.nvim",
            { "folke/neodev.nvim", opts = {} },
            -- "folke/neoconf.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
                opts = {
                    -- options
                },
            },
            "nvimdev/lspsaga.nvim",
        },
        config = function()
            -- require("neoconf").setup()
            require("neodev").setup()
            require("fidget").setup()
            require("lspsaga").setup()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                }
            })
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {}
                    end,
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup {}
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                    ["rust_analyzer"] = function()
                        require("rust-tools").setup {}
                    end,
                }
            }
            local map = vim.keymap.set
            local lsp = vim.lsp.buf
            local tele = require('telescope.builtin')
            map('n', 'gD', lsp.declaration, { desc = 'Goto Declaration' })
            map('n', 'gd', lsp.definition, { desc = 'Goto Definition' })
            map('n', 'K', "<cmd>Lspsaga hover_doc<CR>", { desc = 'Hover Documentation' })
            map('n', 'gi', tele.lsp_implementations, { desc = 'Goto Implementation' })
            map('n', '<C-k>', lsp.signature_help, { desc = 'Signature Documentation' })
            map('n', '<leader>wa', lsp.add_workspace_folder, { desc = 'Workspace Add Folder' })
            map('n', '<leader>wr', lsp.remove_workspace_folder, { desc = 'Workspace Remove Folder' })
            map('n', '<leader>wl', function()
                print(vim.inspect(lsp.list_workspace_folders()))
            end, { desc = 'Workspace List Folder' })
            map('n', '<leader>D', lsp.type_definition, { desc = 'Type Definition' })
            map('n', '<leader>rn', "<cmd>Lspsaga rename ++project<CR>", { desc = 'Rename' })
            map({ 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>", { desc = 'Code Action' })
            map('n', '<leader>da', tele.diagnostics, { desc = 'Diagnostics' })
            map('n', 'gr', tele.lsp_references, { desc = 'Goto References' })
            map('n', '<leader>fc', function()
                lsp.format { async = true }
            end, { desc = 'Format Code' })
        end
    }

}
