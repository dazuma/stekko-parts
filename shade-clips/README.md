# shade-clips

## Overview

This is a design for a set of clips to hold a Vanmade Gear windshield shade up against the windshield of a Transit-based Winnebago Ekko without using the sun visors. The clips are designed to be attached to the screws used for the little velcro "coins" that hold up the OEM cab window curtain. Remove the velcro and reuse the screws to attach these clips in their place. The design includes two clips, a long one for the outside screws and a short one for the inside. There are also backing washers that you can put above the plastic and screw into to secure the clips better. You will need to print two copies of this design to make clips for all four screws. A heat-resistant filament is recommended; the author knows from experience, for example, that PLA will soften due to heat under sunny conditions.

## Using the files

Six files are provided:

* `shade-clips.scad` is the OpenSCAD source file. If you want to tweak the design (such as change the text embossed on the clips), you must do so in this file and then export from OpenSCAD to STL or some other printable format. See the top of the file for various parameters you can modify.

* `shade-clips.stl` is a basic printable STL export using the default parameters. You can print this file directly if you are okay with using the design unmodified.

* `clip-long.stl` is just the long clip _a la carte_.

* `clip-short.stl` is just the short clip _a la carte_.

* `pillar.stl` is just the pillar around which the clips rotate, _a la carte_.

* `backing.stl` is just a backing washer, _a la carte_.

## Building

You can build the files using OpenSCAD directly. Or, if you're a Ruby user, you can use the provided Toys file to run builds from the command line (e.g. `toys build`). See https://dazuma.github.io/toys for information on Toys.
