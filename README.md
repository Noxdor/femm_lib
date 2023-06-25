## About

A Lua 4.0 library for the Finite Element simulation software [FEMMM](https://www.femm.info/wiki/HomePage),
specifically tailored to the needs of TU Dresden students taking the module
[Finite Elemente Methode](https://www.ifte.de/lehre/fem/index.html) in
the course [Simulation in der Gerätetechnik](<https://www.ifte.de/lehre/ET-12_05_07_(Lienig).pdf>).

## Usage

This repository can be used as a template for defining and solving a problem in [FEMMM](https://www.femm.info/wiki/HomePage)
with Lua. It contains a small library that can be used to simplify and clarify some
of the steps that have to be done in order to generate a solution. The simulation is split into steps. Each step
has its own file inside the `sim` folder. These files are being imported in the main Lua script in the top level directory. This
file should not have to be touched, though it can be renamed to fit the problem at hand. Instead, the configurations should be done
inside the `sim` folder in the corresponding step file.

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
