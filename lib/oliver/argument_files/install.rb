def install

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

  # listed_repos.each do |repo|
  #   puts repo
  # end

  # # If the directory doesn't exist
  # # in `Name::OLIVER`, delete it
  # current_repos.each do |directory|
  #   if !listed_repos.to_s.include?(directory_thing) &&
  #                       File.directory?(directory_thing)
  #     `yes | rm -r #{directory_thing}`
  #     # `mv #{directory_thing} .backup`
  #   else
  #     # do nothing at all
  #     # backup_color = Rainbow('.backup').red
  #     # repo_color = Rainbow(repo).red
  #     # puts "There was an error moving #{repo_color}/ to #{backup_color}/"
  #   end
  # end

end
