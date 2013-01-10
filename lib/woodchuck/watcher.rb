require "eventmachine"
require "eventmachine-tail"
require 'addressable/uri'
require 'yajl'
require 'socket'
require 'time'
require 'thread'
require 'forwardable'
require 'woodchuck/tail_reader'

class Woodchuck::Watcher
  extend Forwardable
  
  attr_accessor :paths, :logger, :events, :agent, :input_format
  def_delegator :@agent, :output, :output
  
  def initialize(agent, log_level, input_format, *paths)
    @agent = agent
    @logger = Woodchuck::Logger.new(::STDOUT)
		@logger.level = log_level unless log_level.nil?
    @paths = paths.flatten.compact
		@input_format = input_format
  end

  def start
		Woodchuck::TailReader.static_init(input_format, output)

		EventMachine.run do
			paths.each do |path|
				EventMachine::FileGlobWatchTail.new(path, Woodchuck::TailReader)
			end
		end
  end
  
  def inspect
    to_s
  end
end
