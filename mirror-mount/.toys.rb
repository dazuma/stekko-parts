# frozen_string_literal: true

load File.expand_path("../.toys/.extern/build-generator.rb", context_directory)

expand "build-generator", scad_file: "mirror-mount.scad" do |t|
  t.add_targets("all-pieces", "test-pieces", "nut-mount", "velcro-mount", "inside-panel", "outside-panel")
  t.string_param(:text, "TEXT_STRING", desc: "String to emboss on the mount")
  t.numeric_param(:text_size, "TEXT_SIZE", desc: "Size for the engraved text")
end
