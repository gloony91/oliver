module Commands
	module_function
	def help
		file = File.read('help.json')
		help = JSON.parse(file)
		puts 'usage: olive [command] [args]'
		help.map { |key, value| puts "#{key}\t#{value}"}
	end
	def init; end
	def install; end
	def list; end
	def pull; end
end