# frozen_string_literal: true

ALL_TARGETS = ["shade-clips", "clip-long", "clip-short", "pillar", "backing"]

tool("build") do
  flag(:all)
  flag(:text, "--text TEXT")
  remaining_args(:targets)

  include(:exec, e: true)
  include(:terminal)

  def run
    setup
    build
  end

  def setup
    Dir.chdir(context_directory)
    set(:targets, ALL_TARGETS) if all
    if targets.empty?
      puts "No targets specified. Provide at least one target, or --all", :red
      exit(-1)
    end
    targets.each do |target|
      unless ALL_TARGETS.include?(target)
        puts "Unknown target: #{target}", :red
        exit(-1)
      end
    end
  end

  def build
    targets.each do |target|
      puts "Building: #{target}", :bold
      cmd = [
        "openscad",
        "--export-format=binstl",
        "-o", "#{target}.stl",
        "-D", "TARGET=#{target.inspect}",
      ]
      cmd += ["-D", "TEXT_STRING=#{text.inspect}"] if text
      exec(cmd + ["shade-clips.scad"])
    end
  end
end
