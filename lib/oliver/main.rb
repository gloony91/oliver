# Main oliver file
def run_main

  # Back up your files, man
  if ! File.directory?('backup')
    Dir.mkdir 'backup'
  end

  # The buggiest code in the world (that's probably totally untrue)
  body = File.read(Name::OLIVER.chomp)
  final = YAML.load("---\n#{body}\n---")
  final["repos"].each do |url|

    # Split the url in half
    splitted = url.split '/'
    username = splitted[0]
    repo = splitted[1]

    if ! File.directory?(repo)
      %x(git clone git://github.com/#{url} --quiet)
    else
      puts "#{Rainbow(repo).red}/ already exists."
    end

  end
end
