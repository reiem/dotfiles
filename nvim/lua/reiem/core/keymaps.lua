-- set the leader to space
vim.g.mapleader = ' '

-- Key map for opening file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move hightlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- see https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place when appending lines
vim.keymap.set("n", "J", "mzJ`z")

--keep cursor in place when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in middle of screen when jumping to next search item
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vertical split for leader |
vim.keymap.set("n", "<leader>|", ":vsp<CR>")
-- horizontal split for leader -
vim.keymap.set("n", "<leader>-", ":sp<CR>")
