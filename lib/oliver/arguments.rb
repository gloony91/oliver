# Assign 'files' variable to all of the argument files
# (Make this automatic later on, but for some reason
# automatic isn't working right now, and I don't
# know why :P)
files = %w(add init install list remove update help)
files.each do |file|
  require_relative "argument_files/#{file}"
end

# `argument?` returns help if the
# specified argument is nonexistant
def argument?(argument_number)
  help if ARGV[argument_number].nil?
end

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
  when 'help'
    help
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
   help
 else
   help
 end
  exit
end
