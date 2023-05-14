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

require("remap")
require("lazy").setup({
	{
		"christoomey/vim-tmux-navigator",
		lazy = false, -- load this one immediately
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ':TSUpdate'
	},
	{
		"nvim-treesitter/playground"
	},
	{
		"mbbill/undotree"
	}
})

