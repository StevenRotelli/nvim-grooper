package.path = package.path .. ";../lua/?.lua"
local db = require("nvimgrooper.db")

describe("DB Connection", function()
    it("should connect to the database", function()
        local result = db.connect()
        assert(result == true, "Expected connection to be successful")
    end)
    -- More test cases related to db connections...
end)
