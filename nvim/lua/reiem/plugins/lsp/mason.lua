return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "→",
                    package_uninstalled = "",
                }
            }
        })

        mason_lspconfig.setup({
            -- list of server for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "jsonls",
                "yamlls",
                "dockerls",
                "bashls",
                "vimls",
                "pyright",
                "clangd",
                "groovyls",
                "lua_ls",
            },

            -- auto-install configured servers (with lsp-config)
            automatic_installation = true,
        })
    end,

}
