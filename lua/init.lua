local M = {}

-- Importing submodules
M.db = require("nvim-grooper.db")
M.tree = require("nvim-grooper.tree")
M.utils = require("nvim-grooper.utils")
-- If you have any initialization code, it can go here

return M

--user's init.lua
-- require('nvim-grooper').setup({
--     conn_string = "YOUR_CONNECTION_STRING_HERE"
-- })
--
-- -- When user wants to show the tree
-- require('nvim-grooper.tree').show_tree()
