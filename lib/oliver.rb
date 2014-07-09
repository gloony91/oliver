require_relative "oliver/version"
require 'launchy'
require 'jibry'

if ARGV[0].nil?
  puts 'dude, you need to specify some arguments.'
  exit
end

def help
  puts "it's 12:29 AM and I hate code."
end

case ARGV[0].downcase
when '-v' || '--version'
  puts "oliver v#{Oliver::VERSION}"
when '-h' || '--help'
 help
else
  help
end
