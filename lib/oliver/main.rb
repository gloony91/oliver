require 'awesome_print'
# Main oliver file
def run_main

  # Back up your files, man
  if !File.directory?('.backup')
    Dir.mkdir '.backup'
  end

  # The buggiest code in the world (that's probably totally untrue)
  body = File.read(Name::OLIVER.chomp)
  final = YAML.load("---\n#{body}\n---")
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
      puts "#{Rainbow(repo).green}/ has been successfully cloned."
    else
      puts "#{Rainbow(repo).red}/ already exists."
    end

    # If the directory doesn't exist
    # in `Name::OLIVER`, move it to .backup
    current_repos.each do |directory_thing|
      if !final["repos"].to_s.include? directory_thing
        %x(mv #{directory_thing} .backup)
      end
    end

  end
end
