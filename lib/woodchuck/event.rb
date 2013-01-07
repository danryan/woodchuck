require 'woodchuck/logger'

class Woodchuck::Event
  
  attr_accessor :source_path, :source_host, :timestamp, :source, :message, :fields, :tags
  
  def initialize(init_hsh)
    @source_path = init_hsh["@source_path"] || init_hsh[:source_path]
    @source_host = init_hsh["@source_host"] || init_hsh[:source_host]
    @timestamp = init_hsh["@timestamp"] || init_hsh[:timestamp]
    @source = init_hsh["@source"] || init_hsh[:source]
    @message = init_hsh["@message"] || init_hsh[:message]
    @fields = init_hsh["@fields"] || init_hsh[:fields]
    @tags = init_hsh["@tags"] || init_hsh[:tags]
		@type = init_hsh["@type"] || init_hsh[:type]
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
      '@type' => source.scheme,
      '@tags' => tags,
      '@fields' => fields,
      '@timestamp' => timestamp,
      '@source_host' => source_host,
      '@source_path' => source_path,
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
