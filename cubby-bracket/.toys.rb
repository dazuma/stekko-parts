# frozen_string_literal: true

load File.expand_path("../.toys/.extern/build-generator.rb", context_directory)

expand "build-generator", scad_file: "cubby-bracket.scad" do |t|
  t.add_targets("all-pieces", "left-bracket", "right-bracket")
end
