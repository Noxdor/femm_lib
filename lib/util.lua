local module = {}

-- Returns the length of a table.
function module.length(table)
	local count = 0
	local key, _ = next(table)
	while key do
		count = count + 1
		key, _ = next(table, key)
	end

	return count
end

-- Lua 4.0 doesn't have boolean values, these variables can be used as
-- aliases for 0 and 1 (false and true).
False = 0
True = 1

function module.message(msg, type)
	if type == nil then
		type = "Error"
	end
	messagebox(type, ": ", msg)
end

return module
