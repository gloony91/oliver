require 'json'

module Commands
	module_function

	def help
		file = File.read('lib/oliver/commands.json')
		commands = JSON.parse(file)
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