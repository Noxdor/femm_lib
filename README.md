## About

A Lua 4.0 library for the Finite Element simulation software [FEMM](https://www.femm.info/wiki/HomePage),
specifically tailored to the needs of TU Dresden students taking the module
[Finite Elemente Methode](https://www.ifte.de/lehre/fem/index.html) in
the course [Simulation in der Gerätetechnik](<https://www.ifte.de/lehre/ET-12_05_07_(Lienig).pdf>).

## Usage

This repository can be used as a template for defining and solving a problem in [FEMMM](https://www.femm.info/wiki/HomePage)
with Lua. It contains a small library that can be used to simplify and clarify some
of the steps that have to be done in order to generate a solution. The simulation is split into steps. Each step
has its own file inside the `sim` folder. These files are being imported in the main Lua script in the top level directory. This
file should not have to be touched (except for console and exit functionality), though it can be renamed to fit the problem at hand.
Instead, the configurations should be done inside the `sim` folder in the corresponding step file.

Library modules can be imported by calling:

```lua
dofile("lib/<filename>.lua")
```

For example, to load the **file io** utilities, a call like this can be issued:

```lua
local file_io = dofile("lib/file_io.lua")
```

After that, the library's functionalities can be used:

```lua
file_io.read_input(19, inputs)
```

## Folder structure

There are 4 folders and one main lua script:

.
└───femm_lib
    ├───connection
    ├───lib
    ├───out
    ├───sim
    └───main.lua

Each folder has a different task.

1. `connection`: This folder contains the `Input_xx.txt` and `Output_xx.txt` files, that are required to connect
FEMM to OptiY for nominal value optimisation. Rename the files to match your participant number.
2. `lib`: This folder contains functions that simplify and/or clarify some of the steps needed to create a simulation model and
solve it. It should be understood as "readonly" and ideally not be adjusted. You can look through the files to see what functionalities
it offers.
3. `out`: This folder can be used to save the output files of FEMM to keep the top level folder clean. These files are not really
needed anyway, since the models configuration and result handling happens fully in Lua.
4. `sim`: This folder contains a lua script file for each step needed to create and solve a simulation model, as described above.
5. `main.lua`: This file should be the file loaded into FEMM (directly or indirectly with OptiY). It calls the step scripts inside `sim`,
it also contains the boilerplate code to show/hide the console inside FEMM and close the program at the end of simulation if needed. You
may rename this file to match the simulation model contained in this folder.

> You should definitely rename the foler from `femm_lib` to the simulation model contained in it (e.g. `Lasertrim_xx.lua`).
