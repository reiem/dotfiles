return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc= "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available code actions"
            keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP server"
            keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts)
        end

        -- used to enable automcompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- configure html server
        lspconfig['html'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure css server
        lspconfig['cssls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure json server
        lspconfig['jsonls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure typescript server
        lspconfig['tsserver'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure vim server
        lspconfig['vimls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure bash server
        lspconfig['bashls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure docker server
        lspconfig['dockerls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure yaml server
        lspconfig['yamlls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure rust server
        lspconfig['rust_analyzer'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure python server
        lspconfig['pyright'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure c/c++ server
        lspconfig['clangd'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })

        -- configure lua_ls server
        lspconfig['lua_ls'].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                }
            }
        })
    end
}
