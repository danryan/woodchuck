require 'woodchuck/logger'

class Woodchuck::Event
  
  attr_accessor :path, :line, :host, :timestamp, :source
  
  def initialize(path, line)
    @path = path
    @line = line
    @host = Socket.gethostname
    @timestamp = Time.now.utc.iso8601(6)
    @source = Addressable::URI.new(:scheme => 'file', :host => host, :path => path)
  end
  
  def to_hash
    {
      '@source' => source.to_s,
      '@type' => source.scheme,
      '@tags' => [],
      '@fields' => {},
      '@timestamp' => timestamp,
      '@source_host' => host,
      '@source_path' => path,
      '@message' => line.strip
    }
  end
  
  def to_json(*args)
    to_hash.to_json(*args)
  end
  
  def to_s
    to_json
  end
end
