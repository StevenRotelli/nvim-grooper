local status, grooper = pcall(require, "nvimgrooper")
-- vim.cmd([[ set runtimepath+=~/Developer/vim/nvim-grooper/dev/ ]])
vim.cmd([[set runtimepath+=..]])
print("runtimepath" .. vim.cmd([[get runtimepath]]))
if not status then
    print("nvim-grooper not found")
    return
end
grooper.setup({
    odbc_name = "Grooper",
})
print("found test intit")
-- vim.cmd([[ set runtimepath+=~/.config/nvim ]])
-- vim.cmd([[ set runtimepath+=]] .. vim.fn.expand("~/Developer/vim/nvim-grooper/dev/"))
-- When user wants to show the tree
-- require("nvim-grooper.tree").toggle()
local grooper = require("nvim-grooper").setup({
    odbc_name = "Grooper",
})
