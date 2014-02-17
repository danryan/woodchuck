class Woodchuck::Input::Plain < Woodchuck::Input
	protected

	def prepare_hash(path, line)
		super(path, line).merge(
			{
				:message => line.strip
			}
		)
	end
end
