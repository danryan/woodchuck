require 'tmpdir'
require 'pathname'
require 'fileutils'

# stolen with love from the Listen gem
include FileUtils

# Prepares temporary fixture-directories and
# cleans them afterwards.
#
# @param [Fixnum] number_of_directories the number of fixture-directories to make
#
# @yield [path1, path2, ...] the empty fixture-directories
# @yieldparam [String] path the path to a fixture directory
#

def fixture_path
  Pathname.new(File.expand_path(File.join(pwd, "spec/fixtures/#{Time.now.to_f.to_s.sub('.', '') + rand(9999).to_s}")))
end

def fixtures(fixt_path=nil)
  path = fixt_path || fixture_path
  current_pwd = pwd

  # Create the path
  mkdir_p path
  cd path

  yield(path)

ensure
  cd current_pwd
  rm_rf(path) if File.exists?(path)
end
