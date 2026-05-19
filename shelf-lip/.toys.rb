# frozen_string_literal: true

load File.expand_path("../.toys/.extern/build-generator.rb", context_directory)

expand "build-generator", scad_file: "shelf-lip.scad" do |t|
  t.add_targets("shelf-lip")
  t.string_param(:text, "TEXT_STRING", desc: "String to emboss on the lip")
  t.numeric_param(:text_size, "TEXT_SIZE", desc: "Size for the engraved text")
end
