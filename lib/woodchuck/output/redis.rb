require 'redis'
require 'redis/namespace'

class Woodchuck::Output::Redis < Woodchuck::Output
  attr_accessor :url, :host, :port, :db, :namespace, :key
  
  def initialize
    super
    @type = :redis
    @url = Addressable::URI.parse(ENV['REDIS_URL'] || 'redis://localhost:6379/9')
    @namespace = ENV['REDIS_NAMESPACE'] || 'logstash:woodchuck'
    @key = ENV['REDIS_KEY'] || 'events'
  end
  
  def redis
    client = ::Redis.new(:url => url)
    ::Redis::Namespace.new(namespace, :redis => client)
  end
  
  def handle(event)
    redis.lpush(key, event.to_json)
    @logger.info "Logging event to Redis", event.to_hash
  end
end