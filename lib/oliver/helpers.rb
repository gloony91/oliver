module Helpers
	module_function

	def file
		file = File.read('.oliver')
		return JSON.parse(file)
	end

	def local_repos
		folders = Dir.entries('.').reject do |folder|
			folder['.'] || folder['..'] | folder['.oliver']
		end
		return folders.sort
	end

	def tracked_repos
		tracked = []
		file.map do |user, repos|
			tracked.push(repos)
		end
		return tracked.sort.flatten
	end

	def oliver_exists?
		File.exists?('.oliver')
	end

	def log(text, priority=:default)
		symbol = "==>"
		symbols = { :default => symbol.colorize(:blue),
					:warning => symbol.colorize(:yellow),
					:error => symbol.colorize(:red),
					:success => symbol.colorize(:green) }
		return "#{symbols[priority]} #{text}"
	end

	def install
		# install all repos on the list that aren't local
		log('.oliver does not exist', :error) unless oliver_exists?
		log('.oliver is empty', :error) if file.empty?

		file.map do |user, repos|
			repos.each do |repo|
				url = 'https://github.com/'
				endpoint = "#{user}/#{repo}"

				if File.directory? repo
					puts log("#{repo} already exists", :warning)
				else
					begin
						g = Git.clone(url + endpoint, repo, :path => '.')
						puts log("#{repo} was cloned successfully", :success) if File.directory? repo
					rescue
						puts log("#{repo} failed to clone", :warning)
					end
				end
			end
		end
	end

	def remove
		# check local repos and remove them if they're not in tracked_repos
		local_repos.each do |repo|
			unless tracked_repos.include? repo
				# remove repo
				# check w user first!! be like, yo are you sure about this buddy
				print log("Delete #{repo}? (y/n): ", :warning)
				response = STDIN.gets.chomp.downcase
				if response == 'y'
					puts log("Deleting #{repo}")
					FileUtils.rm_rf(repo)
				else
					puts log("Keeping #{repo}")
				end
			end
		end
	end
end
