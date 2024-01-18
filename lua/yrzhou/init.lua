require("yrzhou.remap")
require("yrzhou.set")

-- Equivalent of set tags=./tags;/
vim.o.tags = "./tags;/"

-- Equivalent of set clipboard+=unnamedplus
vim.o.clipboard = "unnamedplus"

-- Equivalent of set tabstop=8 expandtab shiftwidth=4 softtabstop=4
vim.o.tabstop = 8
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- when scrolling, keep cursor 3 lines away from screen border
vim.o.scrolloff = 3
