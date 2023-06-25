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

return module
