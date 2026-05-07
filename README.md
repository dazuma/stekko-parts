# Stekko Parts

This is an open source archive of a few custom motorhome parts used by Daniel Azuma for his Winnebago EKKO. They are designed for a 2024 model year EKKO 22A (i.e. the Ford Transit model), but may also be useful on similar units.

## List of parts

Each part is under a particular directory. Some are generally useful, while others may be pretty specific to my specific projects or modifications. I'm providing everything as-is with no warranty of fitness for any of your projects.

 *  `bathroom-fan-mount` - This is a mount for a bathroom exhaust fan that fits into the bathroom window shade construct. It might be useful if you are doing a similar project.

 *  `shade-clips` - These are clips that can hold a [Vanmade Gear windshield shade](https://vanmadegear.com/products/ekko-windshield-shade) in place without having to use the cab sun visors. On certain model years of the Transit EKKO, they reuse the screws that hold the little velcro "coins" that hold up the useless OEM cab curtain. They are probably usable for most Transit EKKOs if you have the Vanmade or similar windshield shade.

 *  `mirror-mount` - This is some mounting hardware to better secure a particular mirror to our bathroom door. It's probably not really reusable unless you are mounting the exact same mirror we used.

## FAQ

### How do I use these parts?

Each part will contain a source file in [OpenSCAD](https://openscad.org) format (with suffix `.scad`), and one or more STL files appropriate for 3D printing (with suffix `.stl`). You can use the STL files as-is if they work for you. In other cases you may need to customize them: the `.scad` file will typically have parameters at the top that can be tweaked to alter the design, and then you would need to run OpenSCAD to build your own STL files from the modified SCAD file.

### Is there a charge or license?

See the [LICENSE.md](LICENSE.md) file. In general, you can use these files to print your own parts, but please see the license (a modified BSD 3-clause), if you want to redistribute the files (or any derived STLs, etc.) in any form.

### What's the deal with the name?

Our Winnebago EKKO is named "Stekkosaurus".
