require 'socket'

class Woodchuck::Output
  attr_accessor :type, :logger, :host
  
  def initialize
    @host = Socket.gethostname
    @logger = Woodchuck::Logger.new(::STDOUT)
  end
  
  def handle(event)
    true
  end
end