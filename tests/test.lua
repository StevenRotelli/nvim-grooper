local driver = require("luasql.odbc")
local env = driver.odbc()
local conn

conn = env:connect("Grooper")

if not conn then
    print("Failed to connect to the database using provided connection string")
    return
end

if conn then
    local cur = conn:execute("Select id, name, typename from treenode where typename = 'Grooper.ObjectLibrary'")
    local nodes = {}
    print("Success!")
    while true do
        local row = cur:fetch({}, "a")
        if not row then
            break
        end
        print(row.name)
        print(row.typename)
        print(row.id)
        table.insert(nodes, row)
    end
end
