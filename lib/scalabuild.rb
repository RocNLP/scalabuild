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
  def writeSbt(args) //lines that have a template that is not overridden are ignored.  As a switch, just include a key with empty value
    File.open(File.dirname(__FILE__)+"/build.sbt.template", r) do |f|
      f.each_line do |line|
        keyVal = line.split("#", 2)
        print keyVal[1].gsub(/#{keyVal[0]}/, args[keyVal[0])
      end
    end

  end

end
