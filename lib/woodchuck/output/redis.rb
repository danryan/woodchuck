require 'redis'
require 'redis/namespace'

class Woodchuck::Output::Redis < Woodchuck::Output
  attr_accessor :url, :host, :port, :db, :namespace
  
  def initialize
    super
    @type = :redis
    @url = Addressable::URI.parse(ENV['REDIS_URL'])
    @namespace = ENV['REDIS_NAMESPACE'] || 'logstash:woodchuck'
  end
  
  def redis
    client = ::Redis.new(:url => url)
    ::Redis::Namespace.new(namespace, :redis => client)
  end
  
  def handle(event)
    redis.lpush(namespace, event.to_json)
    @logger.debug "Logging event to Redis", event.to_hash
  end
end