require 'woodchuck/output'

class Woodchuck::Output::ZeroMQ < Woodchuck::Output
  def initialize(log_level)
    super(log_level)
    @type = :zeromq
  end
  
  def handle(event)
    @logger.info event.message, event.to_hash
  end
end
