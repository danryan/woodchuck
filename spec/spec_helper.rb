require 'rubygems'
require 'spork'

Spork.prefork do
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  require 'bundler'
  Bundler.require

  require 'rspec'
  require 'timecop'
  # require 'fakefs'
  require 'fileutils'
  
  require 'woodchuck'
  
  RSpec.configure do |config|
    config.before do
      Timecop.freeze
      # FakeFS.activate!
    end
    config.after do
      Timecop.return
      # FakeFS.deactivate!
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

end

# Crash loud in tests!
Thread.abort_on_exception = true
