local module = {}

-- Accepts a student id (0..99) and reads in the simulation values from
-- a file of the name `Input_<student_id>.txt`. The names of the simulation values
-- are given as a table and they are read in the order they were specified in the table.
-- This function enables access to optimisation functionality with OptiY.
function module.read_input(student_id, values)
	local inputFileName = format("Input_%1$02d.txt", student_id)
	local inputFile = openfile(inputFileName, "r")

	local result = {}

	-- if file was opened successfully, read in data
	if inputFile then
		for i = 1, values.n do
			local value = values[i]
			read(inputFile, "*l")
			result[value] = read(inputFile, "*l", "*n")
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
		for value in values do
			output_line = format("%s=%d", value.name, value.val)
			write(outputFile, "R=", output_line) -- Name und Wert auf separate Zeilen
		end
	end
	closefile(outputFile)
end

return module
