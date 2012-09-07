require 'cabin'

module Woodchuck
  class Logger < Cabin::Channel
    
    def initialize(*args)
      super()
      
      subscribe(args[0])
      
      metrics.channel = Cabin::Channel.new
    end
  end
end