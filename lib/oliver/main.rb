require 'awesome_print'
# Main oliver file
def run_main

  # Back up your files, man
  if !File.directory?('.backup')
    Dir.mkdir '.backup'
  end

  # The buggiest code in the world
  # (that's probably totally untrue)
  body = File.read(Name::OLIVER.chomp)
  final = YAML.load("---\n#{body}\n---")
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
        %x(mv #{directory_thing} .backup)
      end
    end

  end
end
