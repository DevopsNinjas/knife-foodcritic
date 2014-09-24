# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knife-foodcritic/version'

Gem::Specification.new do |spec|
  spec.name          = "knife-foodcritic"
  spec.version       = KnifeFoodcritic::VERSION
  spec.authors       = ["Edmund Dipple"]
  spec.email         = ["elmundio1987@gmail.com"]
  spec.homepage      = "http://www.devopsninjas.com"
  spec.license       = "GPL"
  spec.summary       = "A knife plugin for Chef that generates boiler plate code to help develop and test custom foodcritic rules"
  spec.description   = "Knife-Foodcritic is a plugin for Chef::Knife which automatically generates a new rule file (with an optional description), example spec files and a cookbook to test the rule against. It also generates the spec_helper if it doesn't already exist."
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '~> 10'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency "fakefs", '>= 0.5.3'
  spec.add_dependency "chef"
  spec.add_dependency "foodcritic", "~> 4.0.0"

end
