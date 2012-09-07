ignore %r{^spec/fixtures/}

guard 'rspec', :version => 2, :cli => "--color --format doc" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^spec/support/.+.rb$}) { "spec" }
end

guard 'spork' do
  watch('spec/spec_helper.rb')
  watch(%r{^spec/support/.+.rb$}) { "spec" }
end
