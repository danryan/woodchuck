require 'fallen'

module Woodchuck::Runner
  extend Fallen
  # extend Fallen::CLI
  extend self
  
  def logger
    @logger ||=  Woodchuck::Logger.new(STDOUT)
  end
  
  def logger=(log)
    @logger = log
  end
    
  def read(args=ARGV)
    options = {}

    optparse = OptionParser.new do |opts|
      opts.on('-l', '--log-level [LOG_LEVEL]', [:debug, :warn, :info, :error, :fatal], 'set the log level') do |level|
        options[:log_level] = level.to_sym
      end
      opts.on('-o', '--output [OUTPUT]', 'set the output') do |output|
        options[:output] = output.to_sym
      end
      opts.on('-p', '--paths [PATHS]', Array, 'A list of file paths to watch') do |paths|
        options[:paths] = paths
      end
    end
    optparse.parse!(args)
    options
  end
  
  def run(options={})
    agent = Woodchuck::Agent.new(options)
    agent.start(true)
    Signal.trap('INT') do
      @logger.warn :signal => signal
      agent.stop
      exit 0
    end    
  end
end
