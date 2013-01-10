require 'socket'

class Woodchuck::Output
  attr_accessor :type, :logger, :host
  
  def initialize(log_level)
    @host = Socket.gethostname
    @logger = Woodchuck::Logger.new(::STDOUT)
		@logger.level = log_level
  end
  
  def handle(event)
    true
  end
end
