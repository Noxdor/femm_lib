-- Create the geometry for the simulation problem.
dofile("sim/01_Geometry.lua")()

-- Define materials and apply them to the geometry.
dofile("sim/02_Materials.lua")()

-- Define Boundary Conditions.
dofile("sim/03_Boundary_Conditions.lua")()

-- Solve the problem and handle the results (print them, write them to an ouput file).
dofile("sim/04_Solve.lua")()
