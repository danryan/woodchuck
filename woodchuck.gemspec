# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'woodchuck/version'

Gem::Specification.new do |gem|
  gem.name          = "woodchuck"
  gem.version       = Woodchuck::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors       = ["Dan Ryan"]
  gem.email         = ["dan@appliedawesome.com"]
  # gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{lightweight log shipper for logstash}
  gem.homepage      = "https://github.com/danryan/woodchuck"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  # gem.add_dependency 'listen', '~> 0.5.0'
  gem.add_dependency 'filewatch', '~> 0.3.4'
  gem.add_dependency 'yajl-ruby', '~> 1.1.0'
  gem.add_dependency 'cabin', '~> 0.4.4'
  gem.add_dependency 'addressable', '~> 2.3.2'
  gem.add_dependency 'redis', '~> 3.0.1'
  gem.add_dependency 'redis-namespace', '~> 1.2.1'
  gem.add_dependency 'fallen', '~> 0.0.1'
  
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec', '~> 2.11.0'
  gem.add_development_dependency 'spork', '~> 1.0.0.rc3'
  gem.add_development_dependency 'timecop', '~> 0.4.6'
end
