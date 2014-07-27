def argument?(argument_number)
  help if ARGV[argument_number].nil?
end

def init
  if !File.file?(Name::OLIVER)
    File.open(Name::OLIVER, 'w') do |file|
      file.write("repos:\n")
      file.write("   - \"trommel/oliver\"\n")
      puts "#{Rainbow(Name::OLIVER).green} has been created."
    end
  else
    puts "#{Rainbow(Name::OLIVER).red} already exists."
  end
end

def list
  puts "list repos currently in the Olivefile"
end

def update
  puts "pull updates from each tracked repo on the Olivefile"
end

def add
  argument?(1)
  puts "added #{Rainbow(ARGV[1]).green} to #{Rainbow('Olivefile').green}."
end

def remove
  argument?(1)
  puts "removed #{Rainbow(ARGV[1]).red} from #{Rainbow('Olivefile').green}."
end

# Different arguments
# (Make this into a case statement asap)
# (It'll be way easier and cleaner to work with later)
def different_arguments
  case ARGV[0].downcase
  when 'install'
    run_main
  when 'init'
    init
  when 'list'
    list
  when 'update'
    update
  when 'add'
    add
  when 'remove'
    remove
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
  when '-h' || '--help'
   help
 else
   help
 end
  exit
end
