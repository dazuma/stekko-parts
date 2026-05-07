# frozen_string_literal: true

load File.expand_path("../.toys/.extern/build-generator.rb", context_directory)

expand "build-generator", scad_file: "bathroom-fan-mount.scad" do |t|
  t.add_targets("test-arrangement", "lower-left", "lower-right", "upper-left", "upper-right", "clips")
  t.string_param(:text, "TEXT_STRING", desc: "String to emboss on the mount")
  t.numeric_param(:text_size, "TEXT_SIZE", desc: "Size for the engraved text")
end
