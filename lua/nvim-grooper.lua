-- lua/nvim-grooper/db.lua
local M = {}
local luasql = require("luasql.odbc")
local env = luasql.odbc()
local conn

function M.connect(conn_string)
	conn = env:connect(conn_string)
	return conn
end

function M.fetch_tree_nodes()
	if not conn then
		print("Error: Database connection not established")
		return {}
	end

	local cur = conn:execute("SELECT Id, ParentId FROM TreeNode")
	local nodes = {}
	while true do
		local row = cur:fetch({}, "a")
		if not row then
			break
		end
		table.insert(nodes, row)
	end

	return nodes
end

return M
