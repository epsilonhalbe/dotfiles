vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {expr = true, noremap = true})
