////////////////////////////////////////////////////////////////////////////////
// Some mounting hardware for mounting a mirror on the EKKO bathroom door
// Copyright 2026 Daniel Azuma
////////////////////////////////////////////////////////////////////////////////

// This is a design for a set of mounting hardware for a particular mirror for
// the bathroom window on a Winnebago EKKO. It's intended (1) to strengthen the
// door so repeated vibration doesn't strip/widen screw holes, and (2) ensure
// the mirror doesn't "jump off" mounting screws or hooks. It's designed for a
// particular mirror so probably isn't really reusable for other mirrors
// without substantial modifications.

////////////////////////////////////////////////////////////////////////////////
// You can adjust some parameters here.

// Which target to render. Possible values include:
// "all-pieces", "test-pieces", "nut-mount", "lower-mount",
// "inside-panel", and "outside-panel".
TARGET = "test-pieces";

// Width of the nut mount pice
MOUNT_WIDTH = 45;

// Height of the nut mount piece
MOUNT_HEIGHT = 38;

// Thickness of the nut mount piece
MOUNT_THICKNESS = 8;

// Distance from the top of the nut mount piece to the bolt hole
MOUNT_HOLE_Y = 6;

// Thickness of the washer indentation in the nut mount
MOUNT_WASHER_THICKNESS = 1.0;

// Radius of the washer indentation in the nut mount
MOUNT_WASHER_RADIUS = 5.0;

// Thickness of the hex nut indentation in the nut mount
MOUNT_NUT_THICKNESS = 4.0;

// Radius of the hex nut indentation in the nut mount
MOUNT_NUT_RADIUS = 4.5;

// Width of the lower mount bracket
LOWER_MOUNT_WIDTH = 66;

// Height of the lower mount bracket
LOWER_MOUNT_HEIGHT = 44;

// Distance from the top of the lower mount bracket to the bolt hole
LOWER_MOUNT_HOLE_Y = 12;

// Thickness of the lower mount bracket
LOWER_MOUNT_THICKNESS = 9;

// Thickness of the base of the lower mount bracket, supporting the nut
LOWER_MOUNT_BASE_THICKNESS = 3;

LOWER_MOUNT_CUTOUT_WIDTH = 13;

// Radius of the bolt holes
BOLT_RADIUS = 2.7;

// Width of the inside panel that fits with the nut mount
INSIDE_PANEL_WIDTH = 66;

// Width of the outside panel that is visible on the back of the door
OUTSIDE_PANEL_WIDTH = 70;

// Half the height of the panels
PANEL_HALF_HEIGHT = 20;

// The special half-height for the lower part of the inside panel
PANEL_LOWER_HEIGHT = 32;

// Thickness of the inside panels
INSIDE_PANEL_THICKNESS = 2;

// Thickness of the outside panels
OUTSIDE_PANEL_THICKNESS = 3;

// Rounded corner radius for the outside panels
PANEL_CORNER_RADIUS = 4;

// Spacing between the pegs
PEG_SPACING = 25;

// Length of each peg
PEG_LENGTH = 4;

// Radius of each peg
PEG_RADIUS = 2.4;

// Bevel size of each peg
PEG_BEVEL = 0.4;

// Some text that should be engraved into the outside panel.
TEXT_STRING = "Stekko Parts";

// Font for the engraved text.
TEXT_FONT = "Liberation Sans:style=Bold";

// Size for the engraved text.
TEXT_SIZE = 5.0;

// Depth of the text engraving, in millimeters.
TEXT_DEPTH = 0.4;

// Distance from the bottom of the panel to the text baseline.
TEXT_VOFFSET = 4;

// Distance from the right side of the panel to the text.
TEXT_HOFFSET = 6;

// Spacing between the objects in the design, in millimeters.
OBJECT_SPACING = 3;

// The number of sides when converting rounded sides into polygons. Larger
// means smoother but more complex and slower rendering.
CIRCLE_SIDES = 60;

// A small spacing, in millimeters, to ensure unions overlap.
EPSILON = 0.1;

// End of the parameters
////////////////////////////////////////////////////////////////////////////////

// This section is the actual code for the design. You shouldn't need to modify
// this unless you want to fix or alter the structure.

module nut_mount() {
  difference() {
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT/2, MOUNT_THICKNESS/2]) {
      cube([MOUNT_WIDTH, MOUNT_HEIGHT, MOUNT_THICKNESS], true);
    }
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT-MOUNT_HOLE_Y, MOUNT_THICKNESS]) {
      translate([0, 0, -(MOUNT_WASHER_THICKNESS+MOUNT_NUT_THICKNESS)/2]) {
        cylinder(MOUNT_WASHER_THICKNESS+MOUNT_NUT_THICKNESS+EPSILON, MOUNT_NUT_RADIUS, MOUNT_NUT_RADIUS, true, $fn=6);
      }
      translate([0, 0, -MOUNT_WASHER_THICKNESS/2]) {
        cylinder(MOUNT_WASHER_THICKNESS+EPSILON, MOUNT_WASHER_RADIUS, MOUNT_WASHER_RADIUS, true, $fn=CIRCLE_SIDES);
      }
      translate([0, 0, -MOUNT_THICKNESS/2]) {
        cylinder(MOUNT_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
    }
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT-MOUNT_HOLE_Y-PEG_SPACING/2, MOUNT_THICKNESS-PEG_LENGTH/2+EPSILON/2]) {
      translate([0, -PEG_SPACING/2, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
      translate([-PEG_SPACING/2, 0, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
      translate([PEG_SPACING/2, 0, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
    }
  }
}

module lower_mount() {
  nut_hole_z = LOWER_MOUNT_THICKNESS-LOWER_MOUNT_BASE_THICKNESS-MOUNT_NUT_THICKNESS/2;
  nut_hole_y = LOWER_MOUNT_HEIGHT-LOWER_MOUNT_HOLE_Y;
  difference() {
    translate([LOWER_MOUNT_WIDTH/2, LOWER_MOUNT_HEIGHT/2, LOWER_MOUNT_THICKNESS/2]) {
      cube([LOWER_MOUNT_WIDTH, LOWER_MOUNT_HEIGHT, LOWER_MOUNT_THICKNESS], true);
    }
    translate([LOWER_MOUNT_WIDTH/2, nut_hole_y, LOWER_MOUNT_THICKNESS/2]) {
      cylinder(LOWER_MOUNT_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true,  $fn=CIRCLE_SIDES);
    }
    translate([LOWER_MOUNT_WIDTH/2, nut_hole_y, nut_hole_z]) {
      cylinder(MOUNT_NUT_THICKNESS, MOUNT_NUT_RADIUS, MOUNT_NUT_RADIUS, true, $fn=6);
    }
    translate([LOWER_MOUNT_WIDTH/2, LOWER_MOUNT_HEIGHT-LOWER_MOUNT_HOLE_Y/2+EPSILON/2, nut_hole_z]) {
      cube([MOUNT_NUT_RADIUS*2+1, LOWER_MOUNT_HOLE_Y+EPSILON, MOUNT_NUT_THICKNESS], true);
    }
    translate([LOWER_MOUNT_WIDTH/2, LOWER_MOUNT_HEIGHT-LOWER_MOUNT_HOLE_Y-PEG_SPACING/2, LOWER_MOUNT_THICKNESS-PEG_LENGTH/2+EPSILON/2]) {
      translate([0, -PEG_SPACING/2, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
      translate([-PEG_SPACING/2, 0, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
      translate([PEG_SPACING/2, 0, 0]) {
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      }
    }
    translate([LOWER_MOUNT_CUTOUT_WIDTH/2-EPSILON/2, LOWER_MOUNT_HEIGHT/2, LOWER_MOUNT_THICKNESS/2+LOWER_MOUNT_BASE_THICKNESS]) {
      cube([LOWER_MOUNT_CUTOUT_WIDTH+EPSILON, LOWER_MOUNT_HEIGHT+EPSILON, LOWER_MOUNT_THICKNESS], true);
    }
    translate([LOWER_MOUNT_WIDTH-LOWER_MOUNT_CUTOUT_WIDTH/2+EPSILON/2, LOWER_MOUNT_HEIGHT/2, LOWER_MOUNT_THICKNESS/2+LOWER_MOUNT_BASE_THICKNESS]) {
      cube([LOWER_MOUNT_CUTOUT_WIDTH+EPSILON, LOWER_MOUNT_HEIGHT+EPSILON, LOWER_MOUNT_THICKNESS], true);
    }
  }
}

module inside_panel() {
  difference() {
    union() {
      translate([INSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT/2+PANEL_LOWER_HEIGHT/2, INSIDE_PANEL_THICKNESS/2]) {
        cube([INSIDE_PANEL_WIDTH, PANEL_HALF_HEIGHT+PANEL_LOWER_HEIGHT, INSIDE_PANEL_THICKNESS], true);
      }
      translate([INSIDE_PANEL_WIDTH/2, PANEL_LOWER_HEIGHT-PEG_SPACING/2, INSIDE_PANEL_THICKNESS-EPSILON/2]) {
        translate([0, -PEG_SPACING/2, 0]) {
          translate([0, 0, PEG_LENGTH/2]) {
            cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
          }
          cylinder(PEG_BEVEL+EPSILON, PEG_RADIUS+PEG_BEVEL+EPSILON, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
        }
        translate([-PEG_SPACING/2, 0, 0]) {
          translate([0, 0, PEG_LENGTH/2]) {
            cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
          }
          cylinder(PEG_BEVEL+EPSILON, PEG_RADIUS+PEG_BEVEL+EPSILON, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
        }
        translate([PEG_SPACING/2, 0, 0]) {
          translate([0, 0, PEG_LENGTH/2]) {
            cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
          }
          cylinder(PEG_BEVEL+EPSILON, PEG_RADIUS+PEG_BEVEL+EPSILON, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
        }
      }
    }
    translate([INSIDE_PANEL_WIDTH/2, PANEL_LOWER_HEIGHT, INSIDE_PANEL_THICKNESS/2]) {
      cylinder(INSIDE_PANEL_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
    }
  }
}

module outside_panel() {
  difference() {
    union() {
      difference() {
        translate([OUTSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT, OUTSIDE_PANEL_THICKNESS/2])
          cube([OUTSIDE_PANEL_WIDTH, PANEL_HALF_HEIGHT*2, OUTSIDE_PANEL_THICKNESS], true);
        translate([0, 0, OUTSIDE_PANEL_THICKNESS/2])
          cube([PANEL_CORNER_RADIUS*2, PANEL_CORNER_RADIUS*2, OUTSIDE_PANEL_THICKNESS+EPSILON], true);
        translate([OUTSIDE_PANEL_WIDTH, 0, OUTSIDE_PANEL_THICKNESS/2])
          cube([PANEL_CORNER_RADIUS*2, PANEL_CORNER_RADIUS*2, OUTSIDE_PANEL_THICKNESS+EPSILON], true);
        translate([OUTSIDE_PANEL_WIDTH, PANEL_HALF_HEIGHT*2, OUTSIDE_PANEL_THICKNESS/2])
          cube([PANEL_CORNER_RADIUS*2, PANEL_CORNER_RADIUS*2, OUTSIDE_PANEL_THICKNESS+EPSILON], true);
        translate([0, PANEL_HALF_HEIGHT*2, OUTSIDE_PANEL_THICKNESS/2])
          cube([PANEL_CORNER_RADIUS*2, PANEL_CORNER_RADIUS*2, OUTSIDE_PANEL_THICKNESS+EPSILON], true);
      }
      translate([PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, OUTSIDE_PANEL_THICKNESS/2])
        cylinder(OUTSIDE_PANEL_THICKNESS, PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([OUTSIDE_PANEL_WIDTH-PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, OUTSIDE_PANEL_THICKNESS/2])
        cylinder(OUTSIDE_PANEL_THICKNESS, PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([OUTSIDE_PANEL_WIDTH-PANEL_CORNER_RADIUS, PANEL_HALF_HEIGHT*2-PANEL_CORNER_RADIUS, OUTSIDE_PANEL_THICKNESS/2])
        cylinder(OUTSIDE_PANEL_THICKNESS, PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([PANEL_CORNER_RADIUS, PANEL_HALF_HEIGHT*2-PANEL_CORNER_RADIUS, OUTSIDE_PANEL_THICKNESS/2])
        cylinder(OUTSIDE_PANEL_THICKNESS, PANEL_CORNER_RADIUS, PANEL_CORNER_RADIUS, true, $fn=CIRCLE_SIDES);
    }
    translate([OUTSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT, OUTSIDE_PANEL_THICKNESS/2])
      cylinder(OUTSIDE_PANEL_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
    mirror([1, 0, 0])
      translate([-TEXT_HOFFSET, TEXT_VOFFSET, -EPSILON])
        linear_extrude(TEXT_DEPTH+EPSILON)
          text(TEXT_STRING, font=TEXT_FONT, size=TEXT_SIZE, halign="right");
  }
}

// Rendering

module test_collection() {
  outside_panel();
  translate([0, PANEL_HALF_HEIGHT*2+OBJECT_SPACING, 0]) {
    inside_panel();
    translate([0, PANEL_HALF_HEIGHT+PANEL_LOWER_HEIGHT+OBJECT_SPACING, 0]) {
      nut_mount();
      translate([MOUNT_WIDTH+OBJECT_SPACING, 0, 0]) {
        lower_mount();
      }
    }
  }
}

module all_collection() {
  for (i = [0:2]) {
    translate([0, i*(PANEL_HALF_HEIGHT*2+OBJECT_SPACING), 0]) outside_panel();
  }
  translate([OUTSIDE_PANEL_WIDTH+OBJECT_SPACING, 0, 0]) {
    for (i = [0:2]) {
      translate([0, i*(PANEL_HALF_HEIGHT+PANEL_LOWER_HEIGHT+OBJECT_SPACING), 0]) inside_panel();
    }
  }
  translate([OUTSIDE_PANEL_WIDTH+INSIDE_PANEL_WIDTH+OBJECT_SPACING*2, 0, 0]) {
    lower_mount();
    translate([0, LOWER_MOUNT_HEIGHT+OBJECT_SPACING, 0]) nut_mount();
    translate([0, LOWER_MOUNT_HEIGHT+MOUNT_HEIGHT+OBJECT_SPACING*2, 0]) nut_mount();
  }
}

if (TARGET == "test-pieces") {
  test_collection();
}
else if (TARGET == "all-pieces") {
  all_collection();
}
else if (TARGET == "nut-mount") {
  nut_mount();
}
else if (TARGET == "lower-mount") {
  lower_mount();
}
else if (TARGET == "inside-panel") {
  inside_panel();
}
else if (TARGET == "outside-panel") {
  outside_panel();
}
else {
  echo("ERROR: Unknown TARGET value: ", TARGET);
}
