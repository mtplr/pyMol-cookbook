# PETase enzyme, PDB: 6ANE, DOI:1016/j.bpj.2018.02.005
# To load this script in pyMol: @patH/to/PETase.pml

# @C:\Master\Biochemistry\Seminar\PETase-seminar\petase-6ane.pml

reinit 

fetch 6ane, async=0

remove solvent

select cb, chain B
extract cb2, cb
remove (not cb2)

color grey60, all
color orange, ss s
color cyan, ss h
center cb2
zoom center, 25

select disulfur, resn cys
show sticks, disulfur
color yellow, disulfur

select active_site, resi 133+210+179+181
show sticks, active_site
color red, active_site and name o*   # color all oxygens red
color blue, active_site and name n*  # color all nitrogens blue
color white, active_site and name c* # color the backbone white
color gray, /cb2/B/B/ILE`181 and name c*

set_view (\
     0.864366233,   -0.441162348,    0.241324633,\
     0.264376014,    0.806920886,    0.528186977,\
    -0.427746534,   -0.392746031,    0.814107955,\
     0.000309704,    0.000068523, -153.611953735,\
   -22.551441193,  -60.176387787,    7.473945141,\
   127.907264709,  175.507461548,  -20.000000000 )

scene main, store
set scene_buttons, 1

set_view (\
    -0.900617003,    0.152062714,    0.407130867,\
     0.026284888,    0.954131782,   -0.298224062,\
    -0.433805972,   -0.257884443,   -0.863305032,\
    -0.000168642,    0.000421539, -141.283905029,\
   -18.818548203,  -59.395500183,    8.551980019,\
   124.326545715,  162.127166748,  -20.000000000 )
   
scene behind, store
set scene_buttons, 2

set_view (\
     0.846338809,   -0.319467604,   -0.426192343,\
     0.372464001,   -0.217008650,    0.902313471,\
    -0.380749285,   -0.922406256,   -0.064672224,\
     0.000586160,    0.000082206,  -58.367843628,\
   -22.139692307,  -57.820175171,   18.346393585,\
    34.214847565,   80.315002441,  -20.000000000 )
	
scene top, store
set scene_buttons, 3

set_view (\
    -0.970464230,    0.222098544,   -0.094116926,\
     0.106157504,    0.743596911,    0.660138130,\
     0.216601789,    0.630651116,   -0.745216787,\
    -0.000372091,    0.000405911,  -49.356021881,\
   -27.043807983,  -46.735347748,   21.098249435,\
    40.517169952,   70.649299622,  -20.000000000 )

scene active_site1, store
set scene_buttons, 4

set_view (\
     0.211347789,    0.111788981,    0.970991254,\
    -0.642921507,    0.764161468,    0.051962562,\
    -0.736188591,   -0.635257661,    0.233375162,\
    -0.000215679,    0.000520362,  -50.970176697,\
   -29.169898987,  -46.358890533,   18.876108170,\
    42.134197235,   67.566360474,  -20.000000000 )
	
scene active_site2, store
set scene_buttons, 5

# Movie

# It creates a movie from the selected scenes

mset 1x1000 # 30 fps x 30 seconds

mview store, 1, scene=main
mview store, 250, scene=behind
mview store, 450, scene=top
mview store, 750, scene=active_site1
mview store, 900, scene=active_site2
