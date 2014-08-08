def install

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

  listed_repos = []
  $yaml['repos'].map do |username, repos|
    repos.each do |repo|
      listed_repos.push(repo)
    end
  end

  # Map out the username and repos(array)
  $yaml['repos'].map do |username, repos|
  	# Assign individual repo from repos array
  	repos.each do |repo|
  		if !File.directory?(repo)
  			`git clone git://github.com/#{username}/#{repo} --quiet`
  			if File.directory?(repo)
  				puts "#{success} #{repo}/ has been cloned."
  			else
  				puts "#{error} Cloning #{repo}/ failed."
  			end
  		else
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
      print "#{warning} Would you like to delete #{directory}/? (y/n) "
      `yes | rm -r #{directory}` if STDIN.gets.chomp.downcase == 'y'
    end
  end

end
