////////////////////////////////////////////////////////////////////////////////
// Bathroom window fan mount for a Transit EKKO
// Copyright 2025 Daniel Azuma
////////////////////////////////////////////////////////////////////////////////

// This is a design for a two-piece system to mount an exhaust fan in the Ekko's
// bathroom window.
// The top piece clips to the bottom of the window screen above. The bottom
// piece slots into the top of the blackout screen below, and mounts a fan.
// The dimensions match this one: https://www.amazon.com/dp/B0DD3TZ5XX but you
// can probably adjust some of the parameters below to fit any 120mm fan (or
// even a larger one) that has bolts in the corners.
// This prints in six pieces that have to be attached using small bolts. The
// holes are sized for M4 bolts; you will need four 20mm (or longer) bolts and
// five 16mm (or longer) bolts, along with appropriate nuts and washers.


////////////////////////////////////////////////////////////////////////////////
// Instantiation

// Uncomment this line to visualize a demo of all the pieces together.
// Note that you probably can't print the entire thing all at once since it's
// too large for most printers. For printable renders, use one of the other
// options below.
test_arrangement();

// Uncomment this line to render the lower left panel and clips for printing.
//lower_left_with_clips();

// Uncomment this line to render the lower right panel for printing.
//lower_right();

// Uncomment this line to render the upper left panel for printing.
//upper_left();

// Uncomment this line to render the upper right panel for printing.
//upper_right();


////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the text engraved into the bracket.
// Feel free to modify this to change the text.

// Some text that should be engraved into the bracket.
TEXT_STRING = "Stekko Parts";

// Font for the engraved text. 
TEXT_FONT = "Liberation Sans:style=Bold";

// Size for the engraved text.
TEXT_SIZE = 7.0;

// Depth of the text engraving, in millimeters.
TEXT_DEPTH = 0.6;

// How far, in millimeters, to move the start of the text from the left edge.
TEXT_HOFFSET = 12;

// How far, in millimeters, to move the start of the text from the bottom edge.
TEXT_VOFFSET = 12;

////////////////////////////////////////////////////////////////////////////////
// Parameters affected by the fan's dimensions.
// You may need to modify these if you use a different fan than what I used.

// Fan width
FAN_WIDTH = 120;

// Fan height
FAN_HEIGHT = FAN_WIDTH;

// Horizontal distance between the centers of the fan corner bolts
FAN_SCREW_HDIST = 104.8;

// Vertical distance between the centers of the fan corner bolts
FAN_SCREW_VDIST = FAN_SCREW_HDIST;

// Overlap with the fan edge
FAN_EDGE_OVERLAP = 2;

// Margin of material around the fan screw hole
FAN_SCREW_BRACKET_MARGIN = 7;

// Radius of the screw holes for the fan. This size assumes the fan comes with
// M4 bolts. You may need to adjust it if your fan is different.
FAN_SCREW_RADIUS = 2.4;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the size and general arrangement of the mount.
// These can be modified.

// Thickness of the mount
THICKNESS = 4;

// Width of the blind cassette opening
WINDOW_WIDTH = 270;

// Lower plate height including the part that inserts into the cassette bottom
LOWER_HEIGHT = 240;

// Upper plate height
UPPER_HEIGHT = 240;

// The distance the panel extends past the cassette opening on either side
PANEL_HOVERLAP = 12;

// Space between the bottom of the fan and the cassette bottom insert
BELOW_FAN = 24;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the hole for the power cable.
// These can be modified.

// Distance from the hole to the cassette bottom insert
WIRING_HOLE_VOFFSET = 20;

// Distance from the hole to the side of the cassette opening
WIRING_HOLE_HOFFSET = 20;

// Width of the wiring hole
WIRING_HOLE_WIDTH = 8;

// Height of the wiring hole
WIRING_HOLE_HEIGHT = 8;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the part that inserts into the cassette bottom.
// You probably don't want to modify this unless Winnebago changes the design
// or dimensions of the window shade cassette.

// Total thickness of lower blind insert
INSERT_THICKNESS = 5.6;

// Thickness of the bottom of the lower blind insert
INSERT_BOTTOM_THICKNESS = 2;

// Height of the lower blind insert
INSERT_HEIGHT = 12;

// Height of the wedge portion of the lower blind insert
INSERT_WEDGE_HEIGHT = 5;

// How far inset from the window edge the lower blind insert extends
INSERT_HINSET = 10;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the parts that clip into the upper screen shade.
// You probably don't want to modify this unless Winnebago changes the design
// or dimensions of the window shade cassette.

// Distance from the top to the center of the notches for the shade clip
TOP_NOTCH_VOFFSET = 8.4;

// Distance between the centers of the shade clip notches
TOP_NOTCH_HDIST = 19.6;

// Height of the shade clip notches
TOP_NOTCH_HEIGHT = 3.4;

// Width of each shade clip notch
TOP_NOTCH_WIDTH = 13;

// Depth of each shade clip notch
TOP_NOTCH_DEPTH = 2.6;

// The thickness of the top of the mount where it clips into the upper shade.
// This needs to be at least as large as THICKNESS.
TOP_THICKNESS = 4.5;

// The height of the thicker part at the top where TOP_THICKNESS applies.
THICK_TOP_HEIGHT = 12;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the parts that attach the left and right side pieces.
// These are measured "sideways" perpendicular to the panel.
// You probably don't need to mess with these unless you want to use different
// bolts to attach the halves together.

// The height, or how far the attacher extends from the panel
ATTACHER_HEIGHT = 10;

// The width of each attacher
ATTACHER_WIDTH = 18;

// The thickness of each attacher. Bolts must go in this direction.
ATTACHER_THICKNESS = 5;

// Distance from the attacher center to whatever limits it on the top or bottom.
// Must be greater than half the width.
ATTACHER_VOFFSET = 12;

// Distance from the screw hole center to the panel surface
ATTACHER_SCREW_ZOFFSET = 5;

// Radius of the screw hole in each attacher.
ATTACHER_SCREW_RADIUS = 2.2;

////////////////////////////////////////////////////////////////////////////////
// Parameters dealing with the clips that let the upper part rest on the lower.
// You probably don't need to adjust these unless you want to use different
// bolts to attach the clips.

// The total height of the slot in the upper part that the lower part fits into
// (i.e. the total overlap of the upper and lower parts).
SLOT_HEIGHT = 20;

// The thickness of the slot space. Needs to be wider than TOP_THICKNESS.
SLOT_THICKNESS = 5;

// The thickness of the panel in the slot area. This can be slightly thinner
// than THICKNESS.
UNDER_CLIP_THICKNESS = 3;

// The thickness of the thickest part of the clip
CLIP_THICKNESS = 6;

// The thickness of the tapered end of the clip
CLIP_END_THICKNESS = 2;

// Width of the clip
CLIP_WIDTH = 30;

// How far the center of the clip is from the edge of the cassette opening
CLIP_HOFFSET = 30;

// The height of the part of the clip that connects to the upper panel
CLIP_CONNECTOR_HEIGHT = 12;

// The height of the tapered end of the clip. Must be less than SLOT_HEIGHT.
CLIP_END_HEIGHT = 10;

// Radius of the screw holes for the clip
CLIP_SCREW_RADIUS = 2.2;

// Separation of the clip screw holes
CLIP_SCREW_DIST = 18;

// A small space to ensure the clip connector fits in its panel indentation
FIT_OUTSET = 0.1;

////////////////////////////////////////////////////////////////////////////////
// Other parameters you probably don't need to touch

// Spacing between the objects in the design, in millimeters.
OBJECT_SPACING = 3;

// The number of sides when converting rounded sides into polygons. Larger
// means smoother but more complex and slower rendering.
CIRCLE_SIDES = 60;

// A small spacing, in millimeters. Used to ensure overlap of solids for CSG.
EPSILON = 0.1;

////////////////////////////////////////////////////////////////////////////////
// Common modules that are used by several of the parts below.

// Build an attacher.
// Pass the y-location of the center of the attacher's width.
module attacher(y) {
    total_attacher_thickness = ATTACHER_THICKNESS + ATTACHER_HEIGHT;

    translate([0, y, THICKNESS - EPSILON]) {
        difference() {
            translate([total_attacher_thickness/2, 0, ATTACHER_HEIGHT/2])
                cube([total_attacher_thickness, ATTACHER_WIDTH, ATTACHER_HEIGHT],
                     center = true);
            translate([ATTACHER_THICKNESS + ATTACHER_HEIGHT/2 + EPSILON/2, 0, ATTACHER_HEIGHT/2])
                cube([ATTACHER_HEIGHT + EPSILON, ATTACHER_HEIGHT, ATTACHER_HEIGHT + EPSILON],
                     center = true);
            translate([ATTACHER_THICKNESS + ATTACHER_HEIGHT, 0, ATTACHER_HEIGHT])
                rotate([90, 0, 0])
                    cylinder(h = ATTACHER_WIDTH + EPSILON, r = ATTACHER_HEIGHT,
                             center = true, $fn = CIRCLE_SIDES);
            translate([total_attacher_thickness/2, 0, ATTACHER_SCREW_ZOFFSET])
                rotate([0, 90, 0])
                    cylinder(h = total_attacher_thickness + EPSILON, r = ATTACHER_SCREW_RADIUS,
                             center = true, $fn = CIRCLE_SIDES);
        }
    }
}

// Model a notch. This should be a carve-out (i.e. should be inside difference)
// Pass the height of the model being notched.
module upper_notch(height) {
    translate([TOP_NOTCH_HDIST/2, height - TOP_NOTCH_VOFFSET, 0]) {
        cube([TOP_NOTCH_WIDTH, TOP_NOTCH_HEIGHT, TOP_NOTCH_DEPTH*2], center = true);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Parts

// A clip. Two of these are necessary to build the mounting bracket.
module clip() {
    module screw_hole(x) {
        translate([CLIP_WIDTH/2 + x, CLIP_CONNECTOR_HEIGHT/2, 0])
            cylinder(h = (CLIP_THICKNESS + SLOT_THICKNESS)*2 + EPSILON, r = CLIP_SCREW_RADIUS,
                     center = true, $fn = CIRCLE_SIDES);
    }

    difference() {
        polyhedron(
            points = [
                [0, 0, 0],
                [0, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT, 0],
                [0, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT, CLIP_END_THICKNESS],
                [0, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT - CLIP_END_HEIGHT, CLIP_THICKNESS],
                [0, CLIP_CONNECTOR_HEIGHT, CLIP_THICKNESS],
                [0, CLIP_CONNECTOR_HEIGHT, CLIP_THICKNESS + SLOT_THICKNESS],
                [0, 0, CLIP_THICKNESS + SLOT_THICKNESS],
                [CLIP_WIDTH, 0, 0],
                [CLIP_WIDTH, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT, 0],
                [CLIP_WIDTH, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT, CLIP_END_THICKNESS],
                [CLIP_WIDTH, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT - CLIP_END_HEIGHT, CLIP_THICKNESS],
                [CLIP_WIDTH, CLIP_CONNECTOR_HEIGHT, CLIP_THICKNESS],
                [CLIP_WIDTH, CLIP_CONNECTOR_HEIGHT, CLIP_THICKNESS + SLOT_THICKNESS],
                [CLIP_WIDTH, 0, CLIP_THICKNESS + SLOT_THICKNESS],
            ],
            faces = [
                [0, 1, 2, 3, 4, 5, 6],
                [13, 12, 11, 10, 9, 8, 7],
                [7, 8, 1, 0],
                [8, 9, 2, 1],
                [9, 10, 3, 2],
                [10, 11, 4, 3],
                [11, 12, 5, 4],
                [12, 13, 6, 5],
                [13, 7, 0, 6]
            ],
            convexity = 2
        );
        screw_hole(CLIP_SCREW_DIST/2);
        screw_hole(-CLIP_SCREW_DIST/2);
    }
}

// The upper left panel.
// One of these, and one mirror image, are necessary to build the mounting bracket.
module upper_left0() {
    module main_panel() {
        union() {
            cube([WINDOW_WIDTH/2 + PANEL_HOVERLAP, UPPER_HEIGHT, THICKNESS], center = false);
            translate([0, UPPER_HEIGHT - THICK_TOP_HEIGHT, TOP_THICKNESS - THICKNESS]) {
                cube([WINDOW_WIDTH/2, INSERT_HEIGHT, THICKNESS], center = false);
            }
        }
    }

    module clip_thin() {
        translate([-EPSILON, -EPSILON, UNDER_CLIP_THICKNESS]) {
            cube([WINDOW_WIDTH/2 + PANEL_HOVERLAP + EPSILON*2, SLOT_HEIGHT + EPSILON, THICKNESS],
                 center = false);
        }
    }

    module clip_indent() {
        translate([WINDOW_WIDTH/2 - CLIP_HOFFSET, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT/2, THICKNESS]) {
            cube([CLIP_WIDTH + FIT_OUTSET*2, CLIP_CONNECTOR_HEIGHT + FIT_OUTSET*2,
                  (THICKNESS - UNDER_CLIP_THICKNESS) * 2],
                 center = true);
        }
    }

    module clip_screw_hole(x) {
        translate([WINDOW_WIDTH/2 - CLIP_HOFFSET + x, SLOT_HEIGHT + CLIP_CONNECTOR_HEIGHT/2, 0]) {
            cylinder(h = THICKNESS*2 + EPSILON, r = CLIP_SCREW_RADIUS, center = true, $fn=CIRCLE_SIDES);
        }
    }

    difference() {
        union() {
            main_panel();
            attacher(SLOT_HEIGHT + ATTACHER_VOFFSET);
            attacher(UPPER_HEIGHT/2);
            attacher(UPPER_HEIGHT - SLOT_HEIGHT - ATTACHER_VOFFSET);
        }
        upper_notch(UPPER_HEIGHT);
        clip_thin();
        clip_indent();
        clip_screw_hole(CLIP_SCREW_DIST/2);
        clip_screw_hole(-CLIP_SCREW_DIST/2);
    }
}

// The lower left panel that attaches to the fan.
// One of these, and one mirror image, are necessary to build the mounting bracket.
// The caller needs to add the engraving or the wiring hole.
module lower_left0() {
    module main_panel() {
        union() {
            translate([0, INSERT_HEIGHT, 0]) {
                cube([WINDOW_WIDTH/2 + PANEL_HOVERLAP, LOWER_HEIGHT - INSERT_HEIGHT, THICKNESS],
                     center = false);
            }
            translate([0, LOWER_HEIGHT - THICK_TOP_HEIGHT, TOP_THICKNESS - THICKNESS]) {
                cube([WINDOW_WIDTH/2, INSERT_HEIGHT, THICKNESS], center = false);
            }
        }
    }

    module screw_square(corner_y, hole_y) {
        difference() {
            corner_width = FAN_WIDTH/2 - FAN_SCREW_HDIST/2 + FAN_SCREW_BRACKET_MARGIN;
            corner_height = FAN_HEIGHT/2 - FAN_SCREW_VDIST/2 + FAN_SCREW_BRACKET_MARGIN;
            translate([FAN_WIDTH/2, INSERT_HEIGHT + BELOW_FAN + corner_y, THICKNESS/2]) {
                cube([corner_width*2, corner_height*2, THICKNESS], true);
            }
            translate([FAN_SCREW_HDIST/2, INSERT_HEIGHT + BELOW_FAN + hole_y, THICKNESS/2]) {
                cylinder(h = THICKNESS + EPSILON, r = FAN_SCREW_RADIUS,
                         center = true, $fn=CIRCLE_SIDES);
            }
        }
    }

    module fan_hole() {
        translate([0, INSERT_HEIGHT + BELOW_FAN + FAN_HEIGHT/2, THICKNESS/2]) {
            cube([FAN_WIDTH - FAN_EDGE_OVERLAP*2, FAN_HEIGHT - FAN_EDGE_OVERLAP*2, THICKNESS + EPSILON],
                 center = true);
        }
    }

    module lower_blind_insert() {
        polyhedron(
            points = [
                [0, INSERT_HEIGHT + EPSILON, 0],
                [0, INSERT_HEIGHT, INSERT_THICKNESS],
                [0, INSERT_WEDGE_HEIGHT, INSERT_THICKNESS],
                [0, 0, INSERT_BOTTOM_THICKNESS],
                [0, 0, 0],
                [WINDOW_WIDTH/2 - INSERT_HINSET, INSERT_HEIGHT + EPSILON, 0],
                [WINDOW_WIDTH/2 - INSERT_HINSET, INSERT_HEIGHT, INSERT_THICKNESS],
                [WINDOW_WIDTH/2 - INSERT_HINSET, INSERT_WEDGE_HEIGHT, INSERT_THICKNESS],
                [WINDOW_WIDTH/2 - INSERT_HINSET, 0, INSERT_BOTTOM_THICKNESS],
                [WINDOW_WIDTH/2 - INSERT_HINSET, 0, 0]
            ],
            faces = [
                [0, 1, 2, 3, 4],
                [9, 8, 7, 6, 5],
                [5, 6, 1, 0],
                [6, 7, 2, 1],
                [7, 8, 3, 2],
                [8, 9, 4, 3],
                [9, 5, 0, 4]
            ],
            convexity = 2
        );
    }

    union() {
        difference() {
            main_panel();
            fan_hole();
            upper_notch(LOWER_HEIGHT);
        }
        screw_square(0, FAN_HEIGHT/2 - FAN_SCREW_VDIST/2);
        screw_square(FAN_HEIGHT, FAN_HEIGHT/2 + FAN_SCREW_VDIST/2);
        attacher(LOWER_HEIGHT - SLOT_HEIGHT - ATTACHER_VOFFSET);
        attacher(INSERT_HEIGHT + BELOW_FAN/2);
        lower_blind_insert();
    }
}

module upper_right() {
    mirror([1, 0, 0])
        upper_left0();
}

module upper_left() {
    upper_left0();
}

module lower_right() {
    module wiring_hole() {
        translate([WINDOW_WIDTH/2 - WIRING_HOLE_HOFFSET,
                   WIRING_HOLE_VOFFSET + INSERT_HEIGHT, THICKNESS/2]) {
            cube([WIRING_HOLE_WIDTH, WIRING_HOLE_HEIGHT, THICKNESS + EPSILON],
                 center = true);
        }
    }

    mirror([1, 0, 0]) {
        difference() {
            lower_left0();
            wiring_hole();
        }
    }
}

module lower_left() {
    module engraving() {
        mirror([1, 0, 0])
            translate([TEXT_HOFFSET - WINDOW_WIDTH/2, TEXT_VOFFSET + INSERT_HEIGHT, -EPSILON])
                linear_extrude(TEXT_DEPTH + EPSILON)
                    text(TEXT_STRING, font=TEXT_FONT, size=TEXT_SIZE, valign="center");
    }

    difference() {
        lower_left0();
        engraving();
    }
}

////////////////////////////////////////////////////////////////////////////////
// Arrangements

module arranged_clip(y) {
    translate([0, INSERT_HEIGHT + BELOW_FAN + FAN_HEIGHT/2 + y, 0])
        clip();
}

module lower_left_with_clips() {
    lower_left();
    arranged_clip(OBJECT_SPACING);
    arranged_clip(-OBJECT_SPACING - SLOT_HEIGHT - CLIP_CONNECTOR_HEIGHT);
}

module test_arrangement() {
    translate([- OBJECT_SPACING, OBJECT_SPACING, 0])
        upper_right();
    translate([OBJECT_SPACING, OBJECT_SPACING, 0])
        upper_left();
    translate([- OBJECT_SPACING, - LOWER_HEIGHT - OBJECT_SPACING, 0])
        lower_right();
    translate([OBJECT_SPACING, - LOWER_HEIGHT - OBJECT_SPACING, 0])
        lower_left_with_clips();
}
