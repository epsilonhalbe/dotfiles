vim.cmd[[
nnoremap <silent><leader>v <cmd>CHADopen<cr>
]]
local chadtree_settings = { ["theme"] =
  { ["icon_colour_set"] = "none",
    ["text_colour_set"] = "nord",
  }
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
-- let g:chadtree_settings = {"theme.text_colour_set": "nord"}
