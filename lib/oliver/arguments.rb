# Different arguments
# (Make this into a case statement asap)
# (It'll be way easier and cleaner to work with later)
def different_arguments
  case ARGV[0].downcase
  when 'install'
    run_main
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
    puts "added #{ARGV[1]} to Olivefile"
  when 'remove'
    puts "removed #{ARGV[1]} from Olivefile"
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
    exit
  when '-h' || '--help'
   help
 else
   help
 end
  exit
end
