-- lua/nvim-grooper/init.lua

local M = {}
M.db = require("nvim-grooper.db")
M.tree = require("nvim-grooper.tree")

function M.setup(opts)
	M.db.connect(opts.conn_string)
	-- Further initialization if needed
end

return M

--user's init.lua
-- require('nvim-grooper').setup({
--     conn_string = "YOUR_CONNECTION_STRING_HERE"
-- })
--
-- -- When user wants to show the tree
-- require('nvim-grooper.tree').show_tree()
