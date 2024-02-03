return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      }

      telescope.load_extension('fzf')

      -- set keymaps
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    end
  }
}
