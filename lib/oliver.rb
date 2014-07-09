require_relative "oliver/version"
require 'launchy'
require 'jibry'

olivefile = 'Olivefile'

if ARGV[0].nil?
  puts 'dude, you need to specify some arguments.'
  exit
end

def help
  puts "it's 12:29 AM and I hate code."
end

def oliver_main
  contents = File.read(olivefile).chomp
  puts contents
end

if File.file?(olivefile)
  oliver_main
else
  case ARGV[0].downcase
  when '-v' || '--version'
    puts "oliver v#{Oliver::VERSION}"
  when '-h' || '--help'
   help
  else
    help
  end
end
