# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flika/version'

Gem::Specification.new do |spec|
  spec.name          = "flika"
  spec.version       = Flika::VERSION
  spec.authors       = ["Matthew Jording"]
  spec.email         = ["mjording@gmail.com"]
  spec.description   = %q{"Simple implementation of flickr api client"}
  spec.summary       = %q{"flickr api client"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "faraday"
end
