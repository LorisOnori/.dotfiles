local opts = { silent = true, noremap = true }
local keymap = vim.keymap.set

-- Key mappings
keymap("n", "<leader>tt", ":TroubleToggle<CR>", opts)
keymap("n", "<leader>wd", ":TrouTelescope workspace_diagnostics<CR>", opts)
keymap("n", "<leader>dd", ":TrouTelescope document_diagnostics<CR>", opts)
keymap("n", "<leader>qf", ":TrouTelescope quickfix<CR>", opts)

