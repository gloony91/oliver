# Require libraries
require 'awesome_print'
require 'yaml'

# Read and parse the YAML from the file
file = File.read('test.yml')
yaml = YAML.load(file)

# Map out the username and repos(array)
yaml['repos'].map do |username, repos|
	# Assign individual repo from repos array
	repos.each do |repo|
		if !File.directory?(repo)
			`git clone git://github.com/#{username}/#{repo} --quiet`
			if File.directory?(repo)
				puts "#{repo} was successfully cloned."
			else
				puts "An error occured while cloning #{repo}"
			end
		else
			puts "#{repo} already exists."
		end
	end
end
