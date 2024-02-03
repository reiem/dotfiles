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
            accept = "¬", -- This is <M-l> on my keyboard
            accept_word = false,
            accept_line = false,
            next = "‘", -- This is <M-]> on my keyboard
            prev = "“", -- This is <M-[> on my keyboard
            dismiss = "<C-]>",
          },
        },
      })
    end
  }
}

