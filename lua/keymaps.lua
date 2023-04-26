-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

keymap.set("", "ms", "^", { noremap = true })
keymap.set("", "me", "$", { noremap = true })
keymap.set("n", "mh", "<cmd>nohlsearch<cr>", { noremap = true })

-- plugins

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- nvim-telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
