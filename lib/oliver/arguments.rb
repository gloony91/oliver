def argument?(argument_number)
  help if ARGV[argument_number].nil?
end

require_relative 'arguments/add'
require_relative 'arguments/init'
require_relative 'arguments/install'
require_relative 'arguments/list'
require_relative 'arguments/remove'
require_relative 'arguments/update'

# Different arguments
# (Make this into a case statement asap)
# (It'll be way easier and cleaner to work with later)
def arguments
  case ARGV[0].downcase
  when 'install'
    install
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
