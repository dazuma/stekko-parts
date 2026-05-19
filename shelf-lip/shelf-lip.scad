////////////////////////////////////////////////////////////////////////////////
// Shade clips for Vanmade Shades windshield shade on a Transit EKKO
// Copyright 2026 Daniel Azuma
////////////////////////////////////////////////////////////////////////////////

// This is a design for a lip for the shelves in the small pantry behind the
// dinette seats in a Trekko. It might be useful if you build extra shelves out
// of plywood.

////////////////////////////////////////////////////////////////////////////////
// You can adjust some parameters here.

// Which target to render.
// Only one supported value: "shelf-lip".
TARGET = "shelf-lip";

THICKNESS = 2.5;

PROTRUSION_THICKNESS = 2.0;

WIDTH = 190.0;

UPPER_HEIGHT = 20.0;

CORNER_RADIUS = 4.0;

SECONDARY_CORNER_RADIUS = 1.5;

PROTRUSION_LENGTH = 14.0;

LOWER_HEIGHT = 12.0;

FILLET_RADIUS = 4.0;

SCREW_RADIUS = 1.8;

FRONT_SCREW_INSET = 10;

TOP_SCREW_INSET = 20;

// Some text that should be engraved into the clips.
TEXT_STRING = "Stekko Parts";

// Font for the engraved text.
TEXT_FONT = "Liberation Sans:style=Bold";

// Size for the engraved text.
TEXT_SIZE = 5.0;

// Depth of the text engraving, in millimeters.
TEXT_DEPTH = 0.4;

TEXT_VOFFSET = 4;

TEXT_HOFFSET = 6;

// The number of sides when converting rounded sides into polygons. Larger
// means smoother but more complex and slower rendering.
CIRCLE_SIDES = 60;

// A small spacing, in millimeters, to ensure unions overlap.
EPSILON = 0.1;

// End of the parameters
////////////////////////////////////////////////////////////////////////////////

// This section is the actual code for the lip design. You shouldn't need to
// modify this unless you want to fix or alter the structure.

module shelf_lip() {
  total_height = LOWER_HEIGHT+PROTRUSION_THICKNESS+UPPER_HEIGHT;
  difference() {
    union() {
      difference() {
        cube([WIDTH, total_height, THICKNESS]);
        translate([-EPSILON, -EPSILON, -EPSILON]) {
          cube([CORNER_RADIUS+EPSILON, CORNER_RADIUS+EPSILON, THICKNESS+EPSILON*2]);
        }
        translate([WIDTH-CORNER_RADIUS, -EPSILON, -EPSILON]) {
          cube([CORNER_RADIUS+EPSILON, CORNER_RADIUS+EPSILON, THICKNESS+EPSILON*2]);
        }
        translate([-EPSILON, total_height-SECONDARY_CORNER_RADIUS, -EPSILON]) {
          cube([SECONDARY_CORNER_RADIUS+EPSILON, SECONDARY_CORNER_RADIUS+EPSILON, THICKNESS+EPSILON*2]);
        }
        translate([WIDTH-SECONDARY_CORNER_RADIUS, total_height-SECONDARY_CORNER_RADIUS, -EPSILON]) {
          cube([SECONDARY_CORNER_RADIUS+EPSILON, SECONDARY_CORNER_RADIUS+EPSILON, THICKNESS+EPSILON*2]);
        }
      }
      translate([CORNER_RADIUS, CORNER_RADIUS, 0]) {
        cylinder(THICKNESS, CORNER_RADIUS, CORNER_RADIUS, $fn=CIRCLE_SIDES);
      }
      translate([WIDTH-CORNER_RADIUS, CORNER_RADIUS, 0]) {
        cylinder(THICKNESS, CORNER_RADIUS, CORNER_RADIUS, $fn=CIRCLE_SIDES);
      }
      translate([SECONDARY_CORNER_RADIUS, total_height-SECONDARY_CORNER_RADIUS, 0]) {
        cylinder(THICKNESS, SECONDARY_CORNER_RADIUS, SECONDARY_CORNER_RADIUS, $fn=CIRCLE_SIDES);
      }
      translate([WIDTH-SECONDARY_CORNER_RADIUS, total_height-SECONDARY_CORNER_RADIUS, 0]) {
        cylinder(THICKNESS, SECONDARY_CORNER_RADIUS, SECONDARY_CORNER_RADIUS, $fn=CIRCLE_SIDES);
      }
      difference() {
        translate([0, UPPER_HEIGHT, THICKNESS]) {
          cube([WIDTH, PROTRUSION_THICKNESS, PROTRUSION_LENGTH]);
        }
        translate([-EPSILON, UPPER_HEIGHT-EPSILON, THICKNESS+PROTRUSION_LENGTH-SECONDARY_CORNER_RADIUS]) {
          cube([SECONDARY_CORNER_RADIUS+EPSILON, PROTRUSION_THICKNESS+EPSILON*2, SECONDARY_CORNER_RADIUS+EPSILON]);
        }
        translate([WIDTH-SECONDARY_CORNER_RADIUS, UPPER_HEIGHT-EPSILON, THICKNESS+PROTRUSION_LENGTH-SECONDARY_CORNER_RADIUS]) {
          cube([SECONDARY_CORNER_RADIUS+EPSILON, PROTRUSION_THICKNESS+EPSILON*2, SECONDARY_CORNER_RADIUS+EPSILON]);
        }
      }
      translate([SECONDARY_CORNER_RADIUS, UPPER_HEIGHT, THICKNESS+PROTRUSION_LENGTH-SECONDARY_CORNER_RADIUS]) {
        rotate([-90, 0, 0]) {
          cylinder(PROTRUSION_THICKNESS, SECONDARY_CORNER_RADIUS, SECONDARY_CORNER_RADIUS, $fn=CIRCLE_SIDES);
        }
      }
      translate([WIDTH-SECONDARY_CORNER_RADIUS, UPPER_HEIGHT, THICKNESS+PROTRUSION_LENGTH-SECONDARY_CORNER_RADIUS]) {
        rotate([-90, 0, 0]) {
          cylinder(PROTRUSION_THICKNESS, SECONDARY_CORNER_RADIUS, SECONDARY_CORNER_RADIUS, $fn=CIRCLE_SIDES);
        }
      }
      difference() {
        translate([0, UPPER_HEIGHT-FILLET_RADIUS, THICKNESS-EPSILON]) {
          cube([WIDTH, FILLET_RADIUS+EPSILON, FILLET_RADIUS+EPSILON]);
        }
        translate([-EPSILON, UPPER_HEIGHT-FILLET_RADIUS, THICKNESS+FILLET_RADIUS]) {
          rotate([0, 90, 0]) {
            cylinder(WIDTH+EPSILON*2, FILLET_RADIUS, FILLET_RADIUS, $fn=CIRCLE_SIDES);
          }
        }
      }
    }
    translate([FRONT_SCREW_INSET, total_height-LOWER_HEIGHT/2, -EPSILON]) {
      cylinder(THICKNESS+EPSILON*2, SCREW_RADIUS, SCREW_RADIUS, $fn=CIRCLE_SIDES);
    }
    translate([WIDTH-FRONT_SCREW_INSET, total_height-LOWER_HEIGHT/2, -EPSILON]) {
      cylinder(THICKNESS+EPSILON*2, SCREW_RADIUS, SCREW_RADIUS, $fn=CIRCLE_SIDES);
    }
    translate([TOP_SCREW_INSET, UPPER_HEIGHT-EPSILON, THICKNESS+PROTRUSION_LENGTH-LOWER_HEIGHT/2]) {
      rotate([-90, 0, 0]) {
        cylinder(PROTRUSION_THICKNESS+EPSILON*2, SCREW_RADIUS, SCREW_RADIUS, $fn=CIRCLE_SIDES);
      }
    }
    translate([WIDTH-TOP_SCREW_INSET, UPPER_HEIGHT-EPSILON, THICKNESS+PROTRUSION_LENGTH-LOWER_HEIGHT/2]) {
      rotate([-90, 0, 0]) {
        cylinder(PROTRUSION_THICKNESS+EPSILON*2, SCREW_RADIUS, SCREW_RADIUS, $fn=CIRCLE_SIDES);
      }
    }
    translate([WIDTH-TEXT_HOFFSET, TEXT_VOFFSET, -EPSILON]) {
      linear_extrude(TEXT_DEPTH+EPSILON) {
        rotate([180, 0, 0]) {
          text(TEXT_STRING, font=TEXT_FONT, size=TEXT_SIZE, valign="top", halign="right");
        }
      }
    }
  }
}

if (TARGET == "shelf-lip") {
  shelf_lip();
}
else {
  echo("ERROR: Unknown TARGET value: ", TARGET);
}
