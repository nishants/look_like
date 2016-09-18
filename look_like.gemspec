# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'look_like/version'

Gem::Specification.new do |spec|
  spec.name          = "look_like"
  spec.version       = LookLike::VERSION
  spec.authors       = ["nishant"]
  spec.email         = ["nishant.singh87@gmail.com"]

  spec.summary       = "an rspec matcher for comparing visually similar strings"
  spec.description   = "use as expect('a long paragraph with words').to look_like('another long paragraph with words') "
  spec.homepage      = "http://amoeba.social"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
