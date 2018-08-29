# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-ipub/gem_version.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-ipub'
  spec.version       = CocoapodsIpub::VERSION
<<<<<<< HEAD
  spec.authors       = ['welkiner']
  spec.email         = ['tianliang.black@gmail.com']
=======
  spec.authors       = ['']
  spec.email         = ['']
>>>>>>> Initial commit
  spec.description   = %q{A short description of cocoapods-ipub.}
  spec.summary       = %q{A longer description of cocoapods-ipub.}
  spec.homepage      = 'https://github.com/EXAMPLE/cocoapods-ipub'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
