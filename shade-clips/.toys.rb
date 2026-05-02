# frozen_string_literal: true

tool("build") do
  flag(:all)
  remaining_args(:targets)

  include(:exec, e: true)
  include(:terminal)

  def run
    Dir.chdir(context_directory)
    set(:targets, ["shade-clips", "clip-long", "clip-short", "pillar", "backing"]) if all
    targets.each do |target|
      cmd = [
        "openscad",
        "--export-format=binstl",
        "-o", "#{target}.stl",
        "-D", "TARGET=#{target.inspect}",
        "shade-clips.scad"
      ]
      puts "Building: #{target}", :bold
      exec(cmd)
    end
  end
end
