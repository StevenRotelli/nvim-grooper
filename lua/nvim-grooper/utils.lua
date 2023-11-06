--utils.lua
local M = {}
local lxp = require("lxp")

function find_target_file()
    local extensions = { "csproj", "vbproj", "sln" }
    for _, ext in ipairs(extensions) do
        local files = vim.fn.glob("*. " .. ext)
        if files ~= "" then
            return files
        end
    end
    return nil
end
local callbacks = {}

callbacks.StartElement = function(parser, tagname, attrib)
    if tagname == "YourTargetTag" then
        -- Process the attributes here
        print(attrib.YourTargetAttribute)
    end
end

function M.generate_guid()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format("%x", v)
    end)
end

function read_target_attribute(filepath)
    local file = io.open(filepath, "r")
    if not file then
        print("Could not open file: " .. filepath)
        return
    end

    local content = file:read("*all")
    file:close()

    -- Parse the XML content
    local parser = lxp.new(callbacks)
    parser:parse(content)
    parser:close()
end

local target_file = find_target_file()
if target_file then
    read_target_attribute(target_file)
end

return M
