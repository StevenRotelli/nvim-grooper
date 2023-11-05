vim.cmd([[ set runtimepath+=~/Developer/vim/nvim-grooper ]])
-- vim.cmd([[set runtimepath+=..]])
vim.cmd([[ set runtimepath+=~/.config/nvim ]])

-- When user wants to show the tree
-- require("nvim-grooper.tree").toggle()
require("nvim-grooper").setup({
    odbc_name = "Grooper",
})
