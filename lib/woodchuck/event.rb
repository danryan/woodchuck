require 'woodchuck/logger'

class Woodchuck::Event
  
  attr_accessor :path, :line, :host, :timestamp, :source, :message, :fields, :tags, :type
  
  def initialize(path, line, type)
    @path = path
    @line = line
    @host = Socket.gethostname
    @timestamp = Time.now.utc.iso8601(6)
    @source = Addressable::URI.new(:scheme => 'file', :host => host, :path => path)
    @message = line.strip
    @fields = {}
    @tags = []
    @type = type
  end
  
  def method_missing(symbol, *args, &block)
    if to_hash.has_key?(symbol)
      to_hash
    else
      super(symbol, *args, &block)
    end
  end
  
  def to_hash
    {
      '@source' => source.to_s,
      '@type' => type,
      '@tags' => tags,
      '@fields' => fields,
      '@timestamp' => timestamp,
      '@source_host' => host,
      '@source_path' => path,
      '@message' => message
    }
  end
  
  def to_json(*args)
    to_hash.to_json(*args)
  end
  
  def to_s
    to_json
  end
end
