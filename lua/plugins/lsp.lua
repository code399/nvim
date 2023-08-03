return {
    { -- https://github.com/williamboman/mason.nvim -- LSP,DAP 管理器
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = "Mason",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            -- https://github.com/williamboman/mason-lspconfig.nvim
            "williamboman/mason-lspconfig.nvim",
            -- https://github.com/neovim/nvim-lspconfig
            "neovim/nvim-lspconfig",
            -- https://github.com/simrat39/rust-tools.nvim
            "simrat39/rust-tools.nvim",
            -- https://github.com/folke/neodev.nvim
            { "folke/neodev.nvim", opts = {} },
            -- "folke/neoconf.nvim",
            { -- https://github.com/j-hui/fidget.nvim
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
            },
            -- https://github.com/nvimdev/lspsaga.nvim
            "nvimdev/lspsaga.nvim",
        },
        config = function()
            -- require("neoconf").setup()
            require("neodev").setup({
                library = {
                    plugins = {
                        "plenary.nvim",
                        "telescope.nvim",
                        "nvim-dap-ui"
                    },
                    types = true
                },
            })
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities,
                        }
                    end,
                    ["rust_analyzer"] = function()
                        require("rust-tools").setup()
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup {
                            settings = {
                                Lua = {
                                    workspace = { checkThirdParty = false },
                                    telemetry = { enable = false },
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                }
            }
            local map = vim.keymap.set
            local lsp = vim.lsp.buf
            local tele = require('telescope.builtin')
            map(
                'n', 'gD', lsp.declaration,
                { desc = 'Goto Declaration' } -- 声明
            )
            map(
                'n', 'gd', lsp.definition,
                { desc = 'Goto Definition' } -- 定义
            )
            map(
                'n', 'K', "<cmd>Lspsaga hover_doc<CR>",
                { desc = 'Hover Documentation' }
            )
            map(
                'n', 'gi', tele.lsp_implementations,
                { desc = 'Goto Implementation' }
            )
            map(
                'n', '<C-k>', lsp.signature_help,
                { desc = 'Signature Documentation' }
            )
            map(
                'n', '<leader>wa', lsp.add_workspace_folder,
                { desc = 'Workspace Add Folder' }
            )
            map(
                'n', '<leader>wr', lsp.remove_workspace_folder,
                { desc = 'Workspace Remove Folder' }
            )
            map(
                'n', '<leader>wl', function()
                    print(vim.inspect(lsp.list_workspace_folders()))
                end, { desc = 'Workspace List Folder' }
            )
            map(
                'n', '<leader>D', lsp.type_definition,
                { desc = 'Type Definition' }
            )
            map(
                'n', '<leader>rn', "<cmd>Lspsaga rename ++project<CR>",
                { desc = 'Rename' }
            )
            map(
                { 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>",
                { desc = 'Code Action' }
            )
            map(
                'n', '<leader>da', tele.diagnostics,
                { desc = 'Diagnostics' }
            )
            map(
                'n', 'gr', tele.lsp_references,
                { desc = 'Goto References' }
            )
            map(
                'n', '<leader>cf', function()
                    lsp.format { async = true }
                end, { desc = 'Code Format' })
        end
    }

}
