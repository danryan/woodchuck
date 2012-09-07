module Woodchuck::Runner
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
    puts options.inspect
    agent = Woodchuck::Agent.new(options)
    agent.start
    [ "INT", "TERM"].each do |signal|
      Signal.trap(signal) do
        logger.warn :signal => signal
        agent.stop
      end
    end
    
  end
end
