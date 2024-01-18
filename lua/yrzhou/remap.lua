vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("x", "<leader>pi", '"_dp')
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true })
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true })
vim.keymap.set("n", "<leader>+", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", ":resize -5<CR>", { silent = true })
vim.keymap.set("n", "<leader><", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<leader>>", ":vertical resize +5<CR>", { silent = true })
