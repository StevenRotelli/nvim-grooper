-- lua/nvim-grooper/db.lua
local M = {}
local luaodbc = require("luasql.odbc")
local env = luaodbc.odbc()
local conn
M.odbc_name = nil
M.conn = nil

local args = {
    odbc_name = "Grooper",
    sqlcmd = "Select 'Hello From nvim-grooper'",
}

local function sqlcmd(args)
    if not conn then
        conn = env:connect()
        conn:connect()
        if not conn then
            print("Error: Database connection not established.")
            print("ODBC: " .. conn)
        end
    end
end

local function connect()
    M.conn = env:connect(odbc_name)
    return conn
end

function M.get_object_libraries()
    if not conn then
        print("Error: Database connection not established")
        return {}
    end
    local cur = conn:execute("SELECT Name, Id FROM TreeNode WHERE Tyu = {ProjectID}")
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
