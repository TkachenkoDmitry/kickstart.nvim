vim.keymap.set({ 'n', 'v' }, '<leader>bd', '<cmd>bd!<CR>', { desc = '[D]elete buffer' })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", { desc = "Format" })
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', { noremap = true, desc = 'Toggle file tree', silent = true })

vim.keymap.set("n", "<leader>;a", ":lua require('harpoon.mark').add_file()<CR>", { desc = 'Add file', silent = true })
vim.keymap.set("n", "<leader>;t", ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
	{ desc = 'Toggle menu', silent = true })
vim.keymap.set("n", "<leader>;h", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = 'Nav 1', silent = true })
vim.keymap.set("n", "<leader>;j", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = 'Nav 2', silent = true })
vim.keymap.set("n", "<leader>;k", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = 'Nav 3', silent = true })
vim.keymap.set("n", "<leader>;l", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = 'Nav 4', silent = true })
vim.keymap.set("", "<C-d>", "<C-d> zz", { noremap = true })
vim.keymap.set("", "<C-u>", "<C-u> zz", { noremap = true })
vim.keymap.set("x", "<leader>p", [["_dp]], { noremap = true })
vim.keymap.set("x", "<leader>P", [["_dP]], { noremap = true })

-- trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle triouble" })
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
	{ desc = '[W]orkspace Diagnostics' })
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
	{ desc = '[D]ocument Diagnostics' })
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = '[Q]uickfix' })
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = '[L]oclist' })
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = 'Lsp [R]eferences' })
