# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bboxer/version'

Gem::Specification.new do |spec|
  spec.name          = "bboxer"
  spec.version       = Bboxer::VERSION
  spec.authors       = ["Jordan Stephens"]
  spec.email         = ["jordan@stephens.io"]

  spec.summary       = %q{Fix SVG bounding boxes}
  spec.description   = %q{Fix SVG bounding boxes}
  spec.homepage      = "http://github.com/jordanstephens/bboxer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.3", ">= 3.3.0"
  spec.add_dependency "capybara", "~> 2.7", ">= 2.7.0"
  spec.add_dependency "poltergeist", "~> 1.9", ">= 1.9.0"
end
