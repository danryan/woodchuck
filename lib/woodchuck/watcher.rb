require "filewatch/tail"
require 'addressable/uri'
require 'yajl'
require 'socket'
require 'time'
require 'thread'
require 'forwardable'

class Woodchuck::Watcher
  extend Forwardable
  
  attr_accessor :tailer, :paths, :logger, :events, :agent, :input_format
  def_delegator :@agent, :output, :output
  
  def initialize(agent, log_level, input_format, *paths)
    @agent = agent
    @logger = Woodchuck::Logger.new(::STDOUT)
		@logger.level = log_level unless log_level.nil?
    @tailer = FileWatch::Tail.new
    @paths = paths.flatten.compact
		@input_format = input_format
  end

  def start
    paths.each do |path|
      tailer.tail(path)
    end
    tailer.subscribe do |path, line|
      event = @input_format.create(path, line)
      output.handle(event)
    end
  end
  
  def inspect
    to_s
  end
end
