# frozen_string_literal: true

template "build-generator" do
  def initialize(scad_file:, tool_name: nil, all_targets: [], target_variable: nil)
    @scad_file = scad_file
    @tool_name = tool_name || "build"
    @all_targets = all_targets
    @all_params = {}
    @target_variable = nil || "TARGET"
  end

  def add_targets(*targets)
    @all_targets += targets
  end

  def string_param(param, variable, desc: nil)
    @all_params[param] = [:string, variable, desc]
  end

  def numeric_param(param, variable, desc: nil)
    @all_params[param] = [:numeric, variable, desc]
  end

  attr_accessor :scad_file
  attr_accessor :target_variable
  attr_accessor :tool_name
  attr_reader :all_targets
  attr_reader :all_params

  on_expand do |template|
    raise ::Toys::ToolDefinitionError, "Empty all_targets array" if template.all_targets.empty?

    tool(template.tool_name) do
      desc "Build STL files from #{template.scad_file}"

      static(:all_targets, template.all_targets)
      static(:all_params, template.all_params)
      static(:scad_file, template.scad_file)
      static(:target_variable, template.target_variable)

      template.all_params.each do |param, (type, _variable, desc)|
        acceptor = type == :numeric ? ::Float : ::String
        flag(param, "--#{param} #{type.to_s.upcase}", accept: acceptor, desc: desc)
      end
      remaining_args(:targets)

      include(:exec, e: true)
      include(:terminal)

      def run
        setup
        build
      end

      def setup
        Dir.chdir(context_directory)
        if targets.empty?
          set(:targets, all_targets)
        else
          targets.each do |target|
            unless all_targets.include?(target)
              puts "Unknown target: #{target}", :red
              exit(-1)
            end
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
            "-D", "#{target_variable}=#{target.inspect}",
          ]
          all_params.each do |param, (type, variable, _desc)|
            val = get(param)
            next if val.nil?
            cmd += ["-D", "#{variable}=#{val.inspect}"]
          end
          exec(cmd + [scad_file])
        end
      end
    end
  end
end
