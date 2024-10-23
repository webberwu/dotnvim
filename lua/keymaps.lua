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
-- https://github.com/nvim-telescope/telescope.nvim/blob/82e3cc322ad87b262aef092cb7475e769740e83a/lua/telescope/builtin/files.lua#L167-L184
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
