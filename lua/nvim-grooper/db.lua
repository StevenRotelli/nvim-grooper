-- lua/nvim-grooper/db.lua
local M = {}
local luaodbc = require("luasql.odbc")
local env = luaodbc.odbc()
M.odbc_name = nil
M.conn = nil
-- sql boilerplate to mimize funcs
local function sqlcmd(cmd)
    if not M.conn then
        M.conn = env:connect(M.odbc_name)
        if not M.conn then
            print("Error: Database connection not established.")
            print("ODBC: " .. M.conn)
            return
        end
    end
    local cur = M.conn:execute(cmd)
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

function M.connect(odbc_name)
    M.odbc_name = odbc_name
    M.conn = env:connect(M.odbc_name)
    return M.conn
end

function M.disconnet()
    if M.conn then
        M.conn:close()
    end
end

function M.get_object_libraries()
    return sqlcmd("SELECT Name, Id from TreeNode WHERE TypeName = 'Grooper.ObjectLibrary'")
end

return M
