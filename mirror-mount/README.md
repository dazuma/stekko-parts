# mirror-mount

## Overview

This is a design for mounting hardware for mounting a certain mirror on the EKKO bathroom door. It's quite specific to the particular mirror, and probably not useful otherwise.

## Using the files

* `mirror-mount.scad` is the OpenSCAD source file. If you want to tweak the design (such as change the embossed text), you must do so in this file and then export from OpenSCAD to STL or some other printable format. See the top of the file for various parameters you can modify.

* `mirror-mount.stl` is a basic printable STL export using the default parameters. You can print this file directly if you are okay with using the design unmodified.

## Building

You can build the files using OpenSCAD directly. Or, if you're a Ruby user, you can use the provided Toys file to run builds from the command line (e.g. `toys build --all`). See https://dazuma.github.io/toys for information on Toys.
