require 'spec_helper'
require 'tempfile'

describe Woodchuck::Watcher do
  describe '#initialize' do
    let(:logfile) { Tempfile.new("foobar") }

    subject { described_class.new(logfile) }
    
    it 'sets a logger' do
      subject.logger.should be_a Woodchuck::Logger
    end
    it 'sets a tailer' do
      subject.tailer.should be_a FileWatch::Tail
    end
    it 'sets the watched paths' do
      subject.paths.should == [logfile]
    end
  end

  # describe '#run' do
  #   let(:logfile) { Tempfile.new("foobar") }
  #   let(:path) { fixture_path }
  #   let(:timestamp) { Time.now.utc.iso8601(6) }
  #   subject { described_class.new(logfile) }
  #   
  #   before do
  #     Socket.stub(:gethostname).and_return("example.com")
  #     # subject.run
  #     # logfile.write("a message!\n")
  #     # logfile.flush
  #   end
  # 
  #   # it do
  #   #   subject.events.size.should == 1
  #   # end
  # end
end
