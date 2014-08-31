# Success, warning and error messages
# (Make these public, sometime)
success = "#{Rainbow('Success').underline.green}:"
warning = "#{Rainbow('Warning').underline.yellow}:"
error = "#{Rainbow('Error').underline.red}:"

# Fix this ASAP
if $yaml['repos'].nil?
  message = "This will normally return a bug, so I'm just not going to do it.
You have an empty repos list, though, and that's what's causing this bug.
Try adding something to the list for the time being."
  puts Rainbow(message).red
  exit
end

# Create the empty listed_repos array for later
listed_repos = []

# Map out the username and repos(array)
$yaml['repos'].map do |username, repos|
  # Exit with error if the username or repos is empty
  if username.nil?
    puts "#{error} Your usernames look a little nil."
    exit
  end
  if repos.nil?
    puts "#{error} Your repos look a little nil."
    exit
  end
	# Assign individual repo from repos array
	repos.each do |repo|
    # Add each repo to the listed_repos array
    repos.each do |repo|
      listed_repos.push(repo)
    end
    if username.downcase == 'misc'
      split = repo.split('/')
      if !File.directory?(split[1])
        `git clone git://github.com/#{repo} --quiet`
        if File.directory?(split[1])
          puts "#{success} #{split[1]}/ was cloned."
        else
          puts "#{error} #{split[1]} was not cloned."
        end
      end
      exit
    end
    if !File.directory?(repo)
      # Clone the repo if the directory doesn't already exist
      `git clone git://github.com/#{username}/#{repo} --quiet`
			if File.directory?(repo)
        # If the directory exists after the repo
        # has been cloned, give a success message
				puts "#{success} #{repo}/ has been cloned."
			else
        # If the directory doesn't exist after the
        # has been cloned, give an error message
				puts "#{error} Cloning #{repo}/ failed."
			end
		else
      # Give a warning message if the repo already exists
			puts "#{warning} #{repo}/ already exists."
		end
	end
end

# If the directory doesn't exist
# in `Name::OLIVER`, delete it
# This is an extreme hack
current_repos = Dir.entries '.'
['.', '..', '.backup', Name::OLIVER].each do |i|
  current_repos.delete(i)
end
current_repos.each do |directory|
  unless listed_repos.to_s.include?(directory) &&
                      File.directory?(directory)
    print "#{warning} Would you like to delete #{directory}/? (y/n): "
    `yes | rm -r #{directory}` if STDIN.gets.chomp.downcase == 'y'
  end
end
