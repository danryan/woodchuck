require "eventmachine-tail"

class Woodchuck::TailReader < EventMachine::FileTail

	attr_accessor :input_format, :output

	def self.static_init(input_format, output)
		@@input_format = input_format
		@@output = output
	end

	def initialize(path, startpos = -1)
		super(path, startpos)
		@input_format = @@input_format
		@output = @@output

		@buffer = BufferedTokenizer.new
	end

	def receive_data(data)
		@buffer.extract(data).each do |line|
			@output.handle(@input_format.create(path, line))
		end
	end
end

