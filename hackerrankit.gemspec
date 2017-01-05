# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hackerrankit/version'

Gem::Specification.new do |spec|
  spec.name          = "hackerrankit"
  spec.version       = Hackerrankit::VERSION
  spec.authors       = ["tranvictor"]
  spec.email         = ["vu.tran54@gmail.com"]

  spec.summary       = %q{Command line tool to initialize a small project directory to solve a problem.}
  spec.description   = %q{Command line tool to initialize a small project directory to solve a problem.}
  spec.homepage      = "https://github.com/tranvictor/hackerrankit"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables = ['hackerrankit']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
