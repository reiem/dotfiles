return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "json",
          "yaml",
          "toml",
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "cpp",
          "python",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "bash",
          "dockerfile",
          "graphql",
          "java",
          "regex",
          "rust",
          "c_sharp",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
        },
      }
    end
  },
}
