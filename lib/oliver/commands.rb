require 'json'

module Commands
	module_function

	def help
		file = File.read('lib/oliver/commands.json')
		commands = JSON.parse(file)
		text = <<-EOS
		Usage:
		#{'oliver'.colorize(:blue)} <command> [<args>]
		Commands:
		EOS
		help.map { |key, value| text.push("#{key}\t#{value}") }
		puts help
	end

	def init; end
	def install; end
	def list; end
	def pull; end
end