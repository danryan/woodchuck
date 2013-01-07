require 'json'

class Woodchuck::Input::Plain < Woodchuck::Input
	protected

	def prepare_hash(path, line)
		super(path, line).merge(
			parse_json(line)
		)
	end

	def parse_json(line)
		begin
			JSON.parse(line)
		rescue
			{}
		end
	end
end
