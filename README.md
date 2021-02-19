# pyMol Cookbook

pyMol cookbook and quick notes by Matteo Paolieri for Protein Crystallography course @ University of Cologne (MS Chemistry, WS20).

Table of Contents
=================
* [Table of Contents](#table-of-contents)
* [Misc](#misc)
* [Distances](#distances)
* [Coloring](#coloring)
* [Movies and scenes](#movies-and-scenes)
* [Rendering](#rendering)
* [Useful selections](#useful-selections)
* [Protein stability](#protein-stability)

# Misc

`reinit` clear and delete everything

`fetch 6ane, async=0` download the pdb and wait

`fetch 1w2i, type=2fofc, async=0` download the 2fofc electron density map

`get_symmetry object-name-or-selection` gives you a tuple of 7 elements: (a,b,c), (α,β,γ) and space group name as e.g. "P212121"

[Supercell](https://pymolwiki.org/index.php/Supercell) can display multiple copies of the unit cell.

---

`isomesh mesh1, 1w2i_2fofc, 1.0, active_site, carve=1.6` show electron density map. 

`mesh` is just a name you give. 

`isomesh var_name, ED_data, map_scale, what-residue-put-here, carving` carve cuts out the stuff not related to your active site

---

`set surface_color, gray70` 

`set seq_view, 1` to turn the sequence viewer on.

`remove solvent` remove solvent (water molecules)

`remove Foo` remove one selection

`copy target`, source copy one selection

`hide everything, (chain B)` hide chain B.

`hide all`

`extract Foo, chain A+B+E+F+G` extract the selected chains and call the group `Foo`

Select every beta sheet *beside* B and A.

```
select Asp385, resi 385
show sticks , Asp385
```

show sticks, br. Foo show Foo as sticks (`br` is by residue).

Select Asp385 and show it as sticks.

## Distances

One way to measure distances: `Wizard->measure distance`

Also, you can click on an object, and get e.g. ``#/1w2i/C/A/FMT`1092/C``, so you can say "measure the distance from the residue 2". `mode=2` is the polar mode.

```
dist polar1, resi 1092, resi 20, mode=2
```


## Coloring

Select a chain, color it as cyan and then show it as sticks. 

```
select sheetC, (not sheetB) and (not sheetA) and ss s
color purple, sheetC
```

`util.cbc(selection='(all)',first_color=7,quiet=1,legacy=0,_self=cmd)` color all by chains, to see what chains you have

`color white, all` color everything white

`color grey70` is a good color

`color grey, ss h #h` color all alpha helix

`color purple, ss s #s` color all beta sheets

```
select cpE, chain E
color cyan, cpE
show sticks, cpE
```

You can also click on an obect, see its code and color only it by using that specific path.

```
color gray70, all
color blue, /ca/A/A/TRP`158  # color blue just the W158 in chain A
```


## Movies and scenes
```
# Set a scene (maybe after a "set_view"...)

scene electron_density, store
set scene_buttons, 1

# Movie

# It creates a movie from the selected scenes

mset 1x1000 # 30 fps x 33 seconds

mview store, 1, scene=main
mview store, 250, scene=behind
mview store, 450, scene=top
mview store, 750, scene=active_site1
mview store, 900, scene=active_site2
```

To export a movie: `File > Export Movie As...`


## Rendering

`ray 1920,1080` renders current view in FullHD

## Useful selections

```
# Select Asp385 and color atoms accordingly

select Asp385, resi 385
show sticks , Asp385

select aspzoom, Asp385 expand 5  # select stuff around Asp385
color red, aspzoom and name o*   # color all oxygens red
color blue, aspzoom and name n*  # color all nitrogens blue
color white, aspzoom and name c*     # color the backbone white
center aspzoom
zoom center, 25
```

## Protein stability

Main things to check for protein stability:

- Hydrophobic core (show as spheres; apolar AA)
- Salt bridges
- Disulfide bridges 

In general:

**Salt bridge** (ionic bond): 
* AA Acids: Asp+Glu
* AA Basics: Arg+Lys

```
select basic, resn arg+lys
select acid, resn asp+glu

show sticks, basic
show sticks, acid

color red, basic and name o*
color blue, basic and name n*
color pink, basic and name c*

color red, acid and name o*
color blue, acid and name n*
color pink, acid and name c*

dist name, basic, acid, mode=2
```

**π-π interaction** (weak)

```
select aromatics, (resn phe+tyr+trp+his)
show sticks, aromatics
color pink, aromatics
```

**Solvent interaction**

```
show spheres, solvent  # or sticks, etc...
```

**Disulfide bonds**

```
# We have R-S-S-R'. Cys can make them. 

select disulfur, resn cys
show sticks, disulfur
color yellow, disulfur
```

**Dipole interactions**

It is an interaction between aromatics (Trp, Tyr, Phe) and (Arg, Lys)

```
select aromatics, resn tyr+trp+phe
select arglys, resn arg+lys
color pink, aromatics

show sticks, aromatics
show sticks, arglys

color red, arglys and name o*
color blue, arglys and name n*
color pink, arglys and name c*

color red, aromatics and name o*
color blue, aromatics and name n*
color pink, aromatics and name c*

dist name, arglys, aromatics, mode=2
```

**Hydrophobics**

```
# Tom Stout, 08/05/2004
# https://pymolwiki.org/index.php/Show_hydrophobics

show cartoon, all
color gray, all

select hydrophobes,(resn ala+gly+val+ile+leu+phe+met)
show sticks, (hydrophobes and (!name c+n+o))
color orange,hydrophobes
disable hydrophobes
set cartoon_smooth_loops,0
```

# Resources

* [PyMol wiki](https://pymolwiki.org/index.php/Main_Page)





