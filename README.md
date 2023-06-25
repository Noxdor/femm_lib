## About

A Lua 4.0 library for the Finite Element simulation software [FEMMM](https://www.femm.info/wiki/HomePage),
specifically tailored to the needs of TU Dresden students taking the module
[Finite Elemente Methode](https://www.ifte.de/lehre/fem/index.html) in
the course [Simulation in der Gerätetechnik](<https://www.ifte.de/lehre/ET-12_05_07_(Lienig).pdf>).

## Usage

The library can be used by copying it into the working directy of the main lua script that is loaded
into FEMM for simulation. For example in the following project structure, the file `Leiterplatte1_19.lua`
is the file being loaded into FEMM via its UI. Any library file that is contained in `femm_lib` can then
be accessed by calling

```lua
dofile("femm_lib/<filename>.lua")
```

.
├── femm_lib
│   └── ...
└── Leiterplatte1_19.lua

For example, to load the file io utilities, a call like this can be issued:

```lua
local file_io = dofile("femm_lib/file_io.lua")
```

After that, the library's functionalities can be used:

```lua
file_io.read_input(19, inputs)
```
