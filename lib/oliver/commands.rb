module Commands
	module_function
	def help
		help = {
			init: 'initializes the main directory by creating a base dotfile',
      		install: 'clones/removes repos if they\'re listed',
      		list:    'list user repos',
      		pull:    'pull updates from each tracked repo',
      		version: 'return the current version',
      		help:    'return this help menu',
		}
		puts 'usage: olive [command] [args]'
		advice.map { |key, value| puts "#{key}\t#{value}"}
	end
end