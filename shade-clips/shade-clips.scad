////////////////////////////////////////////////////////////////////////////////
// Shade clips for Vanmade Shades windshield shade on a Transit EKKO
// Copyright 2025-2026 Daniel Azuma
////////////////////////////////////////////////////////////////////////////////

// This is a design for a set of clips to hold a Vanmade Gear windshield shade
// up against the windshield of a Transit-based Winnebago Ekko without using
// the sun visors. The clips are designed to be attached to the screws used for
// the little velcro "coins" that hold up the OEM cab window curtain. Remove
// the velcro and reuse the screws to attach these clips in their place. The
// design includes two clips, a long one for the outside screws and a short one
// for the inside. You will need to print two copies of this design to make
// clips for all four screws. A heat-resistant filament is recommended; the
// author knows from experience, for example, that PLA will soften due to heat
// under sunny conditions.

////////////////////////////////////////////////////////////////////////////////
// You can adjust some parameters here.

// The thickness of the clip in millimeters. This should be less than
// PILLAR_HEIGHT.
THICKNESS = 4.0;

// The width of each clip in millimeters.
WIDTH = 22;

// The length of the shorter clip in millimeters.
LENGTH_SHORTER = 65;

// The length of the longer clip in millimeters.
LENGTH_LONGER = 90;

// The radius of the rounded corners at the end of each clip
CORNER_RADIUS = 5;

// The radius of the screw hole. A 2mm radius is a bit smaller than the OEM
// screws in the Ekko, which may be useful if you want the screw to "bite into"
// the printed plastic hole so it holds in place. If you are printing to a
// hard material or want the screw to move freely, consider a slightly larger
// radius such as 2.5.
SCREW_RADIUS = 2;

// The radius, in millimieters, of the hole in the clip that swivels around the
// screwed-in pillar.
PILLAR_RADIUS = 6;

// The height of the screwed-in pillar. Must be greater than THICKNESS.
PILLAR_HEIGHT = 6.5;

// The height of the backing washer.
BACKING_HEIGHT = 6;

// Some text that should be engraved into the clips.
TEXT_STRING = "Stekko Parts";

// Font for the engraved text.
TEXT_FONT = "Liberation Sans:style=Bold";

// Size for the engraved text.
TEXT_SIZE = 4.8;

// Depth of the text engraving, in millimeters.
TEXT_DEPTH = 0.4;

// How far, in millimeters, to move the start of the text along each clip.
TEXT_OFFSET = 4;

// Spacing between the objects in the design, in millimeters.
OBJECT_SPACING = 3;

// Spacing between the objects and the axes, in millimeters. In most cases this
// doesn't matter, but we use it just in case a system needs the objects to be
// completely in the first quadrant.
EDGE_SPACING = 1;

// The number of sides when converting rounded sides into polygons. Larger
// means smoother but more complex and slower rendering.
CIRCLE_SIDES = 60;

// A small spacing, in millimeters, to ensure that the clip spins freely around
// the size of the pillar.
EPSILON = 0.1;

// Which target to render.
// Possible values include: "clip-long", "clip-short", "pillar", "backing", and
// "shade-clips".
TARGET = "shade-clips";

// End of the parameters
////////////////////////////////////////////////////////////////////////////////

// This section is the actual code for the clip design. You shouldn't need to
// modify this unless you want to fix or alter the structure.

module clip(length) {
    hole_radius = PILLAR_RADIUS+EPSILON;
    translate([WIDTH/2, WIDTH/2, THICKNESS/2])
        difference() {
            union() {
                translate([0, length/2, 0])
                    cube([WIDTH, length, THICKNESS], true);
                cylinder(THICKNESS, WIDTH/2, WIDTH/2, true, $fn=CIRCLE_SIDES);
                translate([WIDTH/2-CORNER_RADIUS, length, 0])
                    cylinder(THICKNESS, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([-WIDTH/2+CORNER_RADIUS, length, 0])
                    cylinder(THICKNESS, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([0, length, 0])
                    cube([WIDTH-CORNER_RADIUS*2, CORNER_RADIUS*2, THICKNESS], true);
            }
            cylinder(THICKNESS+EPSILON, hole_radius, hole_radius, true, $fn=CIRCLE_SIDES);
            translate([0, WIDTH/2+TEXT_OFFSET, TEXT_DEPTH-THICKNESS/2]) rotate([180, 0, 90])
                linear_extrude(TEXT_DEPTH+EPSILON)
                    text(TEXT_STRING, font=TEXT_FONT, size=TEXT_SIZE, valign="center");
        }
}

module pillar() {
    cap_height = PILLAR_HEIGHT-THICKNESS-EPSILON;
    translate([WIDTH/2, WIDTH/2, 0])
        difference() {
            union() {
                translate([0, 0, PILLAR_HEIGHT/2])
                    cylinder(PILLAR_HEIGHT, PILLAR_RADIUS, PILLAR_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([0, 0, cap_height/2])
                    cylinder(cap_height, WIDTH/2, WIDTH/2, true, $fn=CIRCLE_SIDES);
            }
            translate([0, 0, PILLAR_HEIGHT/2])
                cylinder(PILLAR_HEIGHT+EPSILON, SCREW_RADIUS, SCREW_RADIUS, true, $fn=CIRCLE_SIDES);
        }
}

module backing() {
    translate([WIDTH/2, WIDTH/2, BACKING_HEIGHT/2])
        difference() {
            union() {
                cube([WIDTH, WIDTH-CORNER_RADIUS*2, BACKING_HEIGHT], true);
                cube([WIDTH-CORNER_RADIUS*2, WIDTH, BACKING_HEIGHT], true);
                translate([WIDTH/2-CORNER_RADIUS, WIDTH/2-CORNER_RADIUS, 0])
                    cylinder(BACKING_HEIGHT, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([-WIDTH/2+CORNER_RADIUS, WIDTH/2-CORNER_RADIUS, 0])
                    cylinder(BACKING_HEIGHT, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([WIDTH/2-CORNER_RADIUS, -WIDTH/2+CORNER_RADIUS, 0])
                    cylinder(BACKING_HEIGHT, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
                translate([-WIDTH/2+CORNER_RADIUS, -WIDTH/2+CORNER_RADIUS, 0])
                    cylinder(BACKING_HEIGHT, CORNER_RADIUS, CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
            }
            cylinder(BACKING_HEIGHT+EPSILON, SCREW_RADIUS, SCREW_RADIUS, true, $fn=CIRCLE_SIDES);
        }
}

module collection() {
    object_offset = WIDTH+OBJECT_SPACING;
    clip(LENGTH_SHORTER-WIDTH/2);
    translate([object_offset, 0, 0])
        clip(LENGTH_LONGER-WIDTH/2);
    translate([object_offset*2, 0, 0])
        pillar();
    translate([object_offset*2, object_offset, 0])
        pillar();
    translate([object_offset*2, object_offset*2, 0])
        backing();
    translate([object_offset*2, object_offset*3, 0])
        backing();
}

translate([EDGE_SPACING, EDGE_SPACING, 0]) {
    if (TARGET == "shade-clips") {
        collection();
    }
    else if (TARGET == "clip-long") {
        clip(LENGTH_LONGER-WIDTH/2);
    }
    else if (TARGET == "clip-short") {
        clip(LENGTH_SHORTER-WIDTH/2);
    }
    else if (TARGET == "pillar") {
        pillar();
    }
    else if (TARGET == "backing") {
        backing();
    }
    else {
        echo("ERROR: Unknown TARGET value: ", TARGET);
    }
}
