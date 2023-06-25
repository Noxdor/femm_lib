Util = dofile("femm_lib/util.lua")

local module = {}

-- Accepts a student id (0..99) and reads in the simulation values from
-- a file of the name `Input_<student_id>.txt`. The names of the simulation values
-- are given as a table and they are read in the order they were specified in the table.
-- The values are written into the same table with each values name as the key. They can
-- be accessed on the same table after this function returned.
-- This function enables access to optimisation functionality with OptiY.
function module.read_input(student_id, values)
	local inputFileName = format("Input_%1$02d.txt", student_id)
	local inputFile = openfile(inputFileName, "r")

	-- if file was opened successfully, read in data
	if inputFile then
		for i = 1, Util.length(values) do
			local value = values[i]
			read(inputFile, "*l")
			values[value] = read(inputFile, "*l", "*n")
		end

		closefile(inputFile)
	else
		messagebox('Could not open "', inputFileName, '".')
	end
end

function module.write_output(student_id, values)
	outputFileName = format("Output_%1$02d.txt", student_id)
	outputFile = openfile(outputFileName, "w") -- Output-Datei in LUA-Ordner

	if outputFile then
		for i = 1, Util.length(values) do
			local value = values[i]
			local output_line = format("%s=\n%f\n", value.name, value.val)
			write(outputFile, output_line) -- Name und Wert auf separate Zeilen
		end
	end
	closefile(outputFile)
end

return module
