source 'https://rubygems.org'

# Specify your gem's dependencies in woodchuck.gemspec
gemspec

group :test do
  gem 'rake'
end

group :doc do
  gem 'yard', '~> 0.8.2.1'
  gem 'redcarpet', '~> 2.1.1'
end

group :test do
  gem 'guard', '~> 1.3.2'
  gem 'guard-rspec', '~> 1.2.1'
  gem 'guard-spork', '~> 1.1.0'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'growl', '~> 1.0.3'
  gem 'simplecov', '~> 0.6.4'
  gem 'timecop', '~> 0.4.6'
end

# JSON
# gem 'json', :platform => :jruby
gem 'yajl-ruby', :platform => [ :ruby_18, :ruby_19 ]

# OpenSSL
gem 'jruby-openssl', :platform => :jruby