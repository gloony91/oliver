module Commands
	module_function

	def help
		commands = {
			init: 'initializes the main directory by creating a base dotfile',
			update: 'clones/removes repos if they\'re listed',
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
		template = {}
		unless args.empty?
			args.each do |pair|
				# syntax: oliver init trmml=oliver,site,etc
				buffer = pair.split('=')
				username = buffer[0]
				repos = buffer[1].split(',')
				template[username] = repos
			end
		end
		if Helpers.oliver_exists?
			puts Helpers.log('.oliver exists', :warning)
		else
			File.open('.oliver', 'w') do |f|
				f.write(JSON.pretty_generate(template))
				puts Helpers.log('.oliver created.', :success)
			end
		end
	end

	def pull(args)
		# array with all folders in directory
		dirs = Dir.glob('*').select { |f| File.directory? f }
		dirs.each do |dir|
			begin
				g = Git.open(dir)
				g.pull
				puts Helpers.log("Pulled #{dir} successfully")
			rescue
				puts Helpers.log("Failed to pull #{dir}", :error)
			end
		end
	end

	def update(args)
		Helpers.remove
		Helpers.install
	end

	def add(args)
		if !Helpers.oliver_exists?
			puts Helpers.log('.oliver does not exist', :error)
		else
			content = Helpers.file

			args.each do |arg|
				profile = arg.split('/')
				username = profile[0]
				repo = profile[1]

				begin
					content[username].push(repo)
				rescue
					content[username] = []
					content[username].push(repo)
				end

				File.open('.oliver', 'w') do |f|
					f.write(JSON.pretty_generate(content))
					puts Helpers.log("#{repo} added", :success)
				end
			end

		end
	end

	def remove(args)
		if !Helpers.oliver_exists?
			puts Helpers.log('.oliver dose not exist', :error)
		else
			content = Helpers.file

			args.each do |arg|
				profile = arg.split('/')
				username = profile[0]
				repo = profile[1]

				if content[username].include?(repo)
					# good
					index = content[username].index(repo)
					content[username].delete_at(index)

					File.open('.oliver', 'w') do |f|
						f.write(JSON.pretty_generate(content))
						puts Helpers.log("#{repo} removed", :success)
					end
				else
					puts Helpers.log("#{repo} is not listed")
				end
			end

		end
	end

	def list(args)
		# check if listed and local (good)
		# star if listed but not local
		# x if local but not listed
		Helpers.log('.oliver does not exist', :error) unless Helpers.oliver_exists?
		Helpers.log('.oliver is empty', :error) if Helpers.file.empty?

		Helpers.file.map do |user, repos|
			repos.each do |repo|
				# repo is definitely listed at this point
				if Helpers.local_repos.include? repo
					emblem = '✓'.colorize(:green)
				elsif !Helpers.local_repos.include? repo
					emblem = '*'.colorize(:blue)
				end

				puts "#{emblem} #{user}/#{repo}"
			end
		end

		Helpers.local_repos.each do |repo|
			# check if local repos are listed
			# check remotes for fetch and push URL to add user in the future
			if !Helpers.tracked_repos.include? repo
				emblem = '✗'.colorize(:red)
				puts "#{emblem} #{repo}"
			end
		end
	end
end
