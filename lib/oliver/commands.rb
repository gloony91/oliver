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

	def init(args)
		if File.exists?('.oliver')
			puts Helpers.log('.oliver exists', 'warning')
		else
			File.open('.oliver', 'w') do |f|
				template = {trmml: ['oliver']}
				f.write(JSON.pretty_generate(template))
				puts Helpers.log('.oliver created.', 'success')
			end
		end
	end

	def pull(args)
		# array with all folders in directory
		dirs = Dir.glob('*').select { |f| File.directory? f }
		dirs.each do |dir|
			g = Git.open(dir)
			puts Helpers.log("Pulling #{dir}")
			g.pull
		end
		puts Helpers.log('All repos updated successfully', 'success')
	end

	def install; end
	def list; end
end