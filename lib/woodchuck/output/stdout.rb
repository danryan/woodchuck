require 'woodchuck/output'

class Woodchuck::Output::STDOUT < Woodchuck::Output
  def initialize
    super
    @type = :stdout
  end
  
  def handle(event)
    @logger.info "Logging event to STDOUT", event.to_hash
  end
end