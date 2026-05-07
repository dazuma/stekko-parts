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

// Which target to render.
// Possible values include: "all-pieces", "nut-mount", "inside-panel", and
// "outside-panel".
TARGET = "all-pieces";

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
MOUNT_NUT_THICKNESS = 3.5;

// Radius of the hex nut indentation in the nut mount
MOUNT_NUT_RADIUS = 4.5;

// Radius of the bolt holes
BOLT_RADIUS = 2.7;

// Width of the inside panel that fits with the nut mount
INSIDE_PANEL_WIDTH = 60;

// Width of the outside panel that is visible on the back of the door
OUTSIDE_PANEL_WIDTH = 100;

// Half the height of the panels
PANEL_HALF_HEIGHT = 20;

// The special half-height for the lower part of the inside panel
PANEL_LOWER_HEIGHT = 32;

// Thickness of the panels
PANEL_THICKNESS = 3;

// Spacing between the pegs
PEG_SPACING = 25;

// Length of each peg
PEG_LENGTH = 4;

// Radius of each peg
PEG_RADIUS = 2.5;

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
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT/2, MOUNT_THICKNESS/2])
      cube([MOUNT_WIDTH, MOUNT_HEIGHT, MOUNT_THICKNESS], true);
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT-MOUNT_HOLE_Y, MOUNT_THICKNESS]) {
      translate([0, 0, -(MOUNT_WASHER_THICKNESS+MOUNT_NUT_THICKNESS)/2])
        cylinder(MOUNT_WASHER_THICKNESS+MOUNT_NUT_THICKNESS+EPSILON, MOUNT_NUT_RADIUS, MOUNT_NUT_RADIUS, true, $fn=6);
      translate([0, 0, -MOUNT_WASHER_THICKNESS/2])
        cylinder(MOUNT_WASHER_THICKNESS+EPSILON, MOUNT_WASHER_RADIUS, MOUNT_WASHER_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([0, 0, -MOUNT_THICKNESS/2])
        cylinder(MOUNT_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
    }
    translate([MOUNT_WIDTH/2, MOUNT_HEIGHT-MOUNT_HOLE_Y-PEG_SPACING/2, MOUNT_THICKNESS-PEG_LENGTH/2+EPSILON/2]) {
      translate([0, -PEG_SPACING/2, 0])
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([-PEG_SPACING/2, 0, 0])
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
      translate([PEG_SPACING/2, 0, 0])
        cylinder(PEG_LENGTH+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
    }
  }
}

module inside_panel() {
  difference() {
    union() {
      translate([INSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT/2+PANEL_LOWER_HEIGHT/2, PANEL_THICKNESS/2])
        cube([INSIDE_PANEL_WIDTH, PANEL_HALF_HEIGHT+PANEL_LOWER_HEIGHT, PANEL_THICKNESS], true);
      translate([INSIDE_PANEL_WIDTH/2, PANEL_LOWER_HEIGHT-PEG_SPACING/2, PANEL_THICKNESS+PEG_LENGTH/2-EPSILON/2]) {
        translate([0, -PEG_SPACING/2, 0])
          cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
        translate([-PEG_SPACING/2, 0, 0])
          cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
        translate([PEG_SPACING/2, 0, 0])
          cylinder(PEG_LENGTH+EPSILON, PEG_RADIUS, PEG_RADIUS, true, $fn=CIRCLE_SIDES);
      }
    }
    translate([INSIDE_PANEL_WIDTH/2, PANEL_LOWER_HEIGHT, PANEL_THICKNESS/2])
      cylinder(PANEL_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
  }
}

module outside_panel() {
  difference() {
    translate([OUTSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT, PANEL_THICKNESS/2])
      cube([OUTSIDE_PANEL_WIDTH, PANEL_HALF_HEIGHT*2, PANEL_THICKNESS], true);
    translate([OUTSIDE_PANEL_WIDTH/2, PANEL_HALF_HEIGHT, PANEL_THICKNESS/2])
      cylinder(PANEL_THICKNESS+EPSILON, BOLT_RADIUS, BOLT_RADIUS, true, $fn=CIRCLE_SIDES);
    mirror([1, 0, 0])
      translate([-TEXT_HOFFSET, TEXT_VOFFSET, -EPSILON])
        linear_extrude(TEXT_DEPTH+EPSILON)
          text(TEXT_STRING, font=TEXT_FONT, size=TEXT_SIZE, halign="right");
  }
}

// Rendering

module collection() {
  outside_panel();
  translate([0, PANEL_HALF_HEIGHT*2+OBJECT_SPACING, 0]) {
    inside_panel();
    translate([0, PANEL_HALF_HEIGHT+PANEL_LOWER_HEIGHT+OBJECT_SPACING, 0])
      nut_mount();
  }
}

if (TARGET == "all-pieces") {
  collection();
}
else if (TARGET == "nut-mount") {
  nut_mount();
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
