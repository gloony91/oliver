require 'json'

module Commands
	module_function

	def help
		commands = {
			init: 'initializes the main directory by creating a base dotfile',
			install: 'clones/removes repos if they\'re listed',
			list: 'list user repos',
			pull: 'pull updates from each tracked repo',
			version: 'return the current version',
			help: 'return this help menu',
		}
		text = <<-EOS
Usage:\n
\t#{'oliver'.colorize(:blue)} <command> [<args>]
Commands:\n
		EOS
		commands.map { |key, value| text += ("\t#{key}\t#{value}\n") }
		puts text
	end

	def init; end
	def install; end
	def list; end
	def pull; end
end