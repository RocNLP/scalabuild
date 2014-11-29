# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scalabuild/version'

Gem::Specification.new do |spec|
  spec.name          = "scalabuild"
  spec.version       = Scalabuild::VERSION
  spec.authors       = ["mrmechko"]
  spec.email         = ["thesoulshell@gmail.com"]
  spec.summary       = %q{Generate a basic scala-sbt project}
  spec.description   = %q{I'm too lazy to write anything here right now}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["generateScala.rb"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
