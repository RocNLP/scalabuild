require "scalabuild/version"

require 'fileutils'

module Scalabuild
  module_function
  def folder_names
    ["java", "scala", "resources"]
  end

  module_function
  def folder_roots
   ["main", "tests"]
  end

  module_function
  def make_dirs()
    folder_roots.each{ |r|
      folder_names.each{ |n|
        FileUtils.mkdir_p("src/#{r}/#{n}")
      }
    }
  end

  module_function
  def writeSbt(args) #lines that have a template that is not overridden are ignored.  As a switch, just include a key with empty value
    out = File.open("build.sbt", 'w')
    File.open(File.dirname(__FILE__)+"/build.sbt.template", 'r') do |f|
      f.each_line do |line|
        keyVal = line.split("\#", 2)
	if args[keyVal[0]] != nil
          out.write( keyVal[1].gsub(/\#\{#{keyVal[0]}\}/, args[keyVal[0]])+"\n" )
	end
      end
    end
  end

  module_function
  def filler_files
    FileUtil.cp(File.dirname(__FILE__)+"/gitignore", ".gitignore")
    FileUtil.cp(File.dirname(__FILE__)+"/README.md", "README.md")
    FileUtil.cp(File.dirname(__FILE__)+"/LICENSE", "LICENSE")
  end


end
