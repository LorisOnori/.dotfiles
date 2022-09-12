local opts = { silent = true }
local keymap = vim.keymap.set

-- Key mappings
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>bu", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>ts", ":Telescope treesitter<CR>", opts)

