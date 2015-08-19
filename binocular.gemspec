# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'binocular/version'

Gem::Specification.new do |spec|
  spec.name          = "binocular"
  spec.version       = Binocular::VERSION
  spec.authors       = ["Andri Setiawan"]
  spec.email         = ["andrisetiawan@me.com"]
  spec.summary       = %q{Get detail info of Bank Identification Number (BIN) / Issuer Identification Number(IIN)}
  spec.description   = %q{Get detail info of Bank Identification Number (BIN) / Issuer Identification Number(IIN)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["binocular"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
