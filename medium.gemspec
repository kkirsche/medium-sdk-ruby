# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'medium/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'hurley', '~> 0.0'
  spec.add_dependency 'hurley-http-cache', '~> 0.1'

  spec.name          = 'medium-sdk-ruby'
  spec.version       = Medium::VERSION
  spec.authors       = ['Kevin Kirsche']
  spec.email         = ['kev.kirsche@gmail.com']
  spec.licenses      = %w(MIT)

  spec.description   = 'Ruby SDK for interacting with the Medium API'
  spec.homepage      = 'https://github.com/kkirsche/medium-sdk-ruby'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib)

  spec.required_ruby_version = '>= 2.0.0'
  spec.summary       = spec.description
end
