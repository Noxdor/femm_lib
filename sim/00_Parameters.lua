-- this is how you can import functionality from the `lib` folder
File_io = dofile("lib/file_io.lua")
dofile("lib/util.lua") -- not needed here directly, but for definition of `True` and `False`

return function()
  XX = 19 -- participant nr. 00 to 99
  local use_input_file = True

  if use_input_file == True then
    -- values from an Input_xx.txt file
    -- e.g.: In_ = { "s", "Ls", "bz", "d", "RF", "Pmax", "RN", "Szul", "PV", "SF" }

    In_ = {}
    File_io.read_input(XX, In_)
  else
    -- define parameters here as keys to the global In_ table
    -- e.g.:
    -- In_ = {
    --    ["s"] = <value>,
    --    ["Ls"] = <value>,
    --    ["bz"] = <value>,
    --    ...
    -- }

    In_ = {}
  end
end
