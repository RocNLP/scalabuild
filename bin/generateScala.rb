#!/usr/bin/env ruby

require 'scalabuild'


Scalabuild.make_dirs
sbtVals = Hash.new

Scalabuild.writeSbt(sbtVals)
