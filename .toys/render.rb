# frozen_string_literal: true

# Render OpenSCAD designs to PNGs from one or more camera angles. For files
# using this repo's TARGET dispatch convention, auto-detects all TARGET values
# and renders each. Output goes to <repo>/tmp/render/ by default. Used as a
# development aid for visual review of geometry changes.

ANGLES = {
  "iso"   => [55, 0, 25],
  "top"   => [0, 0, 0],
  "front" => [90, 0, 0],
  "side"  => [90, 0, 90],
}.freeze

ANGLE_CHOICES = ANGLES.keys + ["all"]

desc "Render an OpenSCAD design to PNGs for visual review"

long_desc(
  "Renders a .scad file to PNG image(s) using the openscad CLI. For files" \
    " using the repo's TARGET dispatch convention, auto-detects every TARGET" \
    " value in the file and renders each one; otherwise renders whatever the" \
    " file's own default produces. Multiple camera angles can be rendered in" \
    " a single invocation.",
  "",
  "Output PNGs are written under <repo>/tmp/render/ (gitignored).",
  "",
  "Examples:",
  "    toys render shade-clips/shade-clips.scad",
  "    toys render shade-clips/shade-clips.scad --target clip-long --angle iso",
  "    toys render shade-clips/shade-clips.scad -a top",
)

required_arg(:scad, desc: "Path to the .scad file to render")

flag(:targets, "-t NAME", "--target NAME",
     handler: :push, default: [],
     desc: "Render only this TARGET (repeatable; default: every detected TARGET)")

flag(:angle, "-a NAME", "--angle NAME",
     accept: ANGLE_CHOICES, default: "all",
     desc: "One of: #{ANGLE_CHOICES.join(', ')} (default: all)")

flag(:out, "-o DIR", "--out DIR",
     desc: "Output directory (default: <repo>/tmp/render)")

flag(:size, "-s WxH", "--size WxH", default: "800,600",
     desc: "Image size as W,H (default: 800,600)")

flag(:colorscheme, "-c NAME", "--colorscheme NAME", default: "Tomorrow",
     desc: "OpenSCAD colorscheme (default: Tomorrow)")

flag(:verbose, "-v", "--verbose",
     desc: "Print the openscad command being run")

include(:exec)
include(:terminal)
include(:fileutils)

def run
  unless File.file?(scad)
    puts "ERROR: not a file: #{scad}", :red
    exit(1)
  end

  output_dir = out || File.join(context_directory, "tmp", "render")
  mkdir_p(output_dir)

  contents = File.read(scad)
  detected = contents.scan(/TARGET\s*==\s*"([^"]+)"/).flatten.uniq
  detected = [nil] if detected.empty?
  effective_targets = targets.empty? ? detected : targets
  effective_angles = (angle == "all") ? ANGLES.keys : [angle]

  base = File.basename(scad, ".scad")
  failures = []

  effective_targets.each do |target|
    effective_angles.each do |a|
      rx, ry, rz = ANGLES.fetch(a)
      suffix = target ? "-#{target}-#{a}" : "-#{a}"
      out_path = File.join(output_dir, "#{base}#{suffix}.png")

      cmd = [
        "openscad",
        "-o", out_path,
        "--imgsize=#{size}",
        "--camera=0,0,0,#{rx},#{ry},#{rz},0",
        "--viewall",
        "--autocenter",
        "--colorscheme=#{colorscheme}",
      ]
      cmd += ["-D", %(TARGET="#{target}")] if target
      cmd << scad

      label = File.basename(out_path)
      puts "Rendering #{label}", :bold
      puts "  $ #{cmd.shelljoin}" if verbose

      result = exec(cmd, out: :null, err: :null)
      if result.success?
        puts "  -> ok", :green
      else
        puts "  -> FAILED (exit #{result.exit_code})", :red
        failures << label
      end
    end
  end

  puts ""
  puts "Output: #{output_dir}"

  unless failures.empty?
    puts "#{failures.length} render(s) failed: #{failures.join(', ')}", :red
    exit(1)
  end
end
