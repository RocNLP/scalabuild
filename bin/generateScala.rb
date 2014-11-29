#!/usr/bin/env ruby

require 'scalabuild'


Scalabuild.make_dirs
sbtVals = Hash.new

sbtVals["project"] = "TestProject"
sbtVals["versionNumber"] = "1.0"
Scalabuild.writeSbt(sbtVals)
