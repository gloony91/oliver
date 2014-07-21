def argument?(i)
  if ARGV[i].nil?
    help
    exit
  end
end

# Different arguments
# (Make this into a case statement asap)
# (It'll be way easier and cleaner to work with later)
def different_arguments
  case ARGV[0].downcase
  when 'init'
    if !File.file?(Name::OLIVER)
      File.open(Name::OLIVER, 'w') do |file|
        file.write("repos:\n")
        file.write("   - \"trommel/oliver\"\n")
        puts "#{Rainbow(Name::OLIVER).green} has been created."
      end
    else
      puts "#{Rainbow(Name::OLIVER).red} already exists."
    end
    exit
  when 'list'
    puts "list repos currently in the Olivefile"
  when 'update'
    puts "pull updates from each tracked repo on the Olivefile"
  when 'add'
    argument?(1)
    puts "added #{ARGV[1]} to Olivefile"
  when 'remove'
    argument?(1)
    puts "removed #{ARGV[1]} from Olivefile"
  end
  exit
end
