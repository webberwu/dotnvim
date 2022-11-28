-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("", "ms", "^", { noremap = true })
keymap.set("", "me", "$", { noremap = true })

-- plugins

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- nvim-telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
