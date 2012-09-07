require 'spec_helper'
require 'tempfile'
require 'pp'

describe Woodchuck::Agent do
  describe '#initialize' do
    let(:logfile) { Tempfile.new("foobar") }

    subject { described_class.new }
    
    it 'sets a logger' do
      subject.logger.should be_a Woodchuck::Logger
    end
    it 'sets a tailer' do
      subject.watcher.should be_a Woodchuck::Watcher
    end
  end

  describe '#start' do
    let(:path) { fixture_path }
    let(:log_dir) { path + "**/*" }
    let(:log_file) { File.open(path + 'foo', 'w+') }
    let(:timestamp) { Time.now.utc.iso8601(6) }

    subject { described_class.new(log_dir.to_s) }
    
    before do
      Socket.stub(:gethostname).and_return("example.com")

      fixtures path do
        touch log_file
      end
    end
    
    after do
      subject.stop
    end

    it 'gets a list of events' do
      subject.start
      log_file.write("a message!\n")
      log_file.flush      
      # subject.watcher.events.size.should == 1
    end
    # it do
    #   subject.events.size.should == 1
    # end
  end
end
