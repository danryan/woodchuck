require 'socket'

class Woodchuck::Input

  def create(path, line)
		Woodchuck::Event.new(prepare_hash(path, line))
	end

	protected

	def prepare_hash(path, line)
		host = Socket.gethostname

		{
			:source_path => path,
			:line => line,
			:source_host => host,
			:timestamp => Time.now.utc.iso8601(6),
			:source => Addressable::URI.new(:scheme => 'file', :host => host, :path => path),
			:type => 'file',
			:fields => {},
			:tags => []
		}
	end
end
