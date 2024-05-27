return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>", -- This is <M-l> on my keyboard
            accept_word = false,
            accept_line = false,
            next = "<M-]>", -- This is <M-]> on my keyboard
            prev = "M-[>", -- This is <M-[> on my keyboard
            dismiss = "<C-]>",
          },
        },
      })
    end
  }
}

