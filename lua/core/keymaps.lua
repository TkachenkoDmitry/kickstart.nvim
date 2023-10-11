vim.keymap.set({ 'n', 'v' }, '<leader>bd', '<cmd>bd!<CR>', { desc = '[D]elete buffer' })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", { desc = "Format" })
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', { noremap = true, desc = 'Toggle file tree' })
