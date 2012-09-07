require 'woodchuck/output'

class Woodchuck::Output::STDOUT < Woodchuck::Output
  def initialize
    super
    @type = :stdout
  end
  
  def handle(event)
    puts event.to_hash
    @logger.info "Logging event to STDOUT", event.to_hash
  end
end