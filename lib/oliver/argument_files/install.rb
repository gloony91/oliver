def install

  # Back up your files, man
  backup_directory_name = '.backup'
  Dir.mkdir backup_directory_name unless File.directory? backup_directory_name

  # Fix this ASAP
  if $final['repos'].nil?
    message = "This will normally return a bug, so I'm just not going to do it.
You have an empty repos list, though, and that's what's causing this bug.
Try adding something to the list for the time being."
    puts Rainbow(message).red
    exit
  end

  listed_repos = []

  $final['repos'].each do |what|
    listed_repos.push(what)
  end
  $final['repos'].each do |url|

    # Split the url in half
    splitted = url.split '/'
    repo = splitted[1]
    current_repos = Dir.entries '.'
    ['.', '..', '.backup', Name::OLIVER].each do |i|
      current_repos.delete(i)
    end

    # Clone the repo if it doesn't already exist
    if !File.directory?(repo)
      `git clone git://github.com/#{url} --quiet`
      if File.directory?(repo)
        puts "#{Rainbow(repo).green}/ has been successfully cloned."
      else
        puts "There was an error cloning #{Rainbow(repo).red}/."
      end
    else
      puts "#{Rainbow(repo).red}/ already exists."
    end

    # If the directory doesn't exist
    # in `Name::OLIVER`, move it to .backup
    current_repos.each do |directory_thing|
      if !listed_repos.to_s.include?(directory_thing) &&
                          File.directory?(directory_thing)
        `mv #{directory_thing} .backup`
      else
        backup_color = Rainbow('.backup').red
        repo_color = Rainbow(repo).red
        puts "There was an error moving #{repo_color}/ to #{backup_color}/"
      end
    end
  end
end
