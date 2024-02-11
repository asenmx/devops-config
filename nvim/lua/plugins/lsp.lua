return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local masonlsp = require("mason-lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local function opts(desc)
                return { noremap = true, silent = true, desc = desc }
            end


            -- LSP Keymaps
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts("LSP: Go to declaration"))
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts("LSP: Go to definition"))
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts("LSP: Hover information"))
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts("LSP: Go to implementation"))
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts("LSP: Show signature help"))
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts("LSP: Add workspace folder"))
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts("LSP: Remove workspace folder"))
            vim.keymap.set("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, opts("LSP: List workspace folders"))
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts("LSP: Go to type definition"))
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts("LSP: Rename symbol"))
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts("LSP: Code actions"))
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts("LSP: List references"))
            vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts("Diagnostics: Open floating window"))
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts("Diagnostics: Go to previous diagnostic"))
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts("Diagnostics: Go to next diagnostic"))
            vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts("Diagnostics: Set to location list"))
            vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts("LSP: Workspace symbols"))
            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts("LSP: Format buffer"))


            mason.setup()
            masonlsp.setup {
                ensure_installed = {
                    "ansiblels",
                    "bashls",
                    "clangd",
                    "lua_ls",
                    "cssls",
                    "dockerls",
                    "jsonls",
                    "pyright",
                    "ruff_lsp",
                },
            }
            vim.diagnostic.config({
                virtual_text = {
                    prefix = '■', -- Could be any symbol you prefer
                    source = 'always', -- 'always' or 'if_many'
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })

            -- Setup servers with default configuration
            lspconfig.ansiblels.setup {}
            lspconfig.bashls.setup {}
            lspconfig.clangd.setup {}
            lspconfig.lua_ls.setup {}
            lspconfig.cssls.setup {}
            lspconfig.dockerls.setup {}
            lspconfig.ruff_lsp.setup {
                capabilities = capabilities

            }
            lspconfig.pyright.setup {
                capabilities = capabilities
            }
        end,
    },
}
