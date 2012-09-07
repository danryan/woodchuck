require 'yajl'
require 'socket'
require 'thread'

require 'woodchuck/output'

class Woodchuck::Agent

  attr_accessor :logger, :watcher, :watcher_thread, :paths, :output

  def initialize(options={})
    @paths = options[:paths]
    @logger = Woodchuck::Logger.new(::STDOUT)
    @mutex = Mutex.new
    @output = case options[:output]
                 when :stdout 
                   Woodchuck::Output::STDOUT.new
                 when :zeromq
                   Woodchuck::Output::ZeroMQ.new
                 when :redis
                  Woodchuck::Output::ZeroMQ.new
                 else
                   Woodchuck::Output::STDOUT.new
                 end
    @watcher = Woodchuck::Watcher.new(self, @paths)
  end

  def start(blocking=false)
    @mutex.synchronize do
      return if @stop == false
      @stop = false
    end
    @watcher_thread = Thread.new { @watcher.start }
    @watcher_thread.join if blocking
  end
  
  def stop
    @mutex.synchronize do
      return if @stop == true
      @stop = true
    end
    Thread.kill(@watcher_thread) if @watcher_thread
  end
  
  def inspect
    to_s
  end
end
