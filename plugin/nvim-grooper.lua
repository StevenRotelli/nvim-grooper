local M = {}
local db = require("nvim-grooper.db")

function M.setup(opts)
	print("setup")
	opts = opts or {}
	local odbc_name = opts.odbc_name

	if odbc_name == nil then
		odbc_name = "Grooper"
	end

	local connection = db.connect(odbc_name)
	if not connection then
		print("Failed to connect to ODBC namme" .. odbc_name .. "databse using the")
		return
	end
end
function M.show()
	local nodes = db.get_object_libraries()
	print(nodes)
end
return M
