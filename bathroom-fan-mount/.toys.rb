# frozen_string_literal: true

tool("build") do
  flag(:all)
  remaining_args(:targets)

  include(:exec, e: true)
  include(:terminal)

  def run
    Dir.chdir(context_directory)
    set(:targets, ["test-arrangement", "lower-left", "lower-right", "upper-left", "upper-right", "clips"]) if all
    targets.each do |target|
      cmd = [
        "openscad",
        "--export-format=binstl",
        "-o", "#{target}.stl",
        "-D", "TARGET=#{target.inspect}",
        "bathroom-fan-mount.scad"
      ]
      puts "Building: #{target}", :bold
      exec(cmd)
    end
  end
end
