////////////////////////////////////////////////////////////////////////////////
// A special L bracket I used when building a storage cubby in the TV delete
// Copyright 2025-2026 Daniel Azuma
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// You can adjust some parameters here.

// Which target to render. Possible values include:
// "all-pieces", "left-bracket", "right-bracket".
TARGET = "all-pieces";

SCREW_RADIUS = 2.2;
LENGTH = 40;
THICKNESS = 2.5;
BEVEL_RADIUS = 4;
WIDTH = 15;
HOLE_HOFFSET = 8;
HOLE_VOFFSET = 10;
CIRCLE_SIDES = 60;
EPSILON = 0.1;
OBJECT_SPACING = 2;

////////////////////////////////////////////////////////////////////////////////
// Model implementation

module bracket() {
  difference() {
    union() {
      difference() {
        translate([0, WIDTH/2, WIDTH/2]) {
          cube([LENGTH, WIDTH, WIDTH], center = true);
        }
        translate([0, WIDTH/2 + THICKNESS, WIDTH/2 + THICKNESS]) {
          cube([LENGTH + EPSILON, WIDTH, WIDTH], center = true);
        }
      }
      difference() {
        width2 = THICKNESS + BEVEL_RADIUS;
        translate([0, width2/2, width2/2]) {
          cube([LENGTH, width2, width2], center = true);
        }
        translate([0, width2, width2]) {
          rotate([0, 90, 0]) {
            cylinder(h = LENGTH + EPSILON, r = BEVEL_RADIUS, center = true, $fn = CIRCLE_SIDES);
          }
        }
      }
    }
    translate([HOLE_HOFFSET - LENGTH/2, 0, HOLE_VOFFSET]) {
      rotate([90, 0, 0]) {
        cylinder(h = WIDTH, r = SCREW_RADIUS, center = true, $fn = CIRCLE_SIDES);
      }
    }
    translate([LENGTH / 2 - HOLE_HOFFSET, HOLE_VOFFSET, 0]) {
      cylinder(h = WIDTH, r = SCREW_RADIUS, center = true, $fn = CIRCLE_SIDES);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////
// Rendering

module left_bracket() {
  translate([0, OBJECT_SPACING, 0]) {
    bracket();
  }
}

module right_bracket() {
  translate([0, -OBJECT_SPACING, 0]) {
    mirror([0, 1, 0]) {
      bracket();
    }
  }
}

if (TARGET == "all-pieces") {
  left_bracket();
  right_bracket();
}
else if (TARGET == "left-bracket") {
  left_bracket();
}
else if (TARGET == "right-bracket") {
  right_bracket();
}
else {
  echo("ERROR: Unknown TARGET value: ", TARGET);
}
