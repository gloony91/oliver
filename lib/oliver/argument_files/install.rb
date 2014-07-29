def install
  if !File.file? Name::OLIVER
    puts "#{Rainbow('Olivefile').red} does not exist."
    init
  end

  # Back up your files, man
  if !File.directory?('.backup')
    Dir.mkdir '.backup'
  end

  # The buggiest code in the world
  # (that's probably totally untrue)
  body = File.read(Name::OLIVER.chomp)
  final = YAML.load("---\n#{body}\n---")

  # Fix this ASAP
  if final["repos"].nil?
    message = "This will normally return a bug, so I'm just not going to do it.
You have an empty repos list, though, and that's what's causing this bug.
Try adding something to the list for the time being."
    puts Rainbow(message).red
    exit
  end

  listed_repos = []

  final["repos"].each do |what|
    listed_repos.push(what)
  end
  final["repos"].each do |url|

    # Split the url in half
    splitted = url.split '/'
    username = splitted[0]
    repo = splitted[1]
    current_repos = Dir.entries '.'
    ['.', '..', '.backup', Name::OLIVER].each do |i|
      current_repos.delete(i)
    end

    # Clone the repo if it doesn't already exist
    if !File.directory?(repo)
      %x(git clone git://github.com/#{url} --quiet)
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
      if !listed_repos.to_s.include? directory_thing
        if !File.directory?(directory_thing)
          %x(mv #{directory_thing} .backup)
        else
          backup_color = Rainbow('.backup/').red
          repo_color = Rainbow(repo).red
          puts "There was an error moving #{repo_color}/ to #{backup_color}"
        end
      end
    end
  end
end