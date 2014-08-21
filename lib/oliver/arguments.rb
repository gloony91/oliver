# Require files
%w(oliver_file_name file_manager).each { |file| require_relative file }

# `argument?` returns help if the specified argument is nonexistant
def argument?(argument_number) help if ARGV[argument_number].nil? end

# Different arguments
case ARGV[0]
when 'install'
  require_relative 'argument_files/install'
when 'init'
  require_relative 'argument_files/init'
when 'list'
  require_relative 'argument_files/list'
when 'update'
  require_relative 'argument_files/update'
when 'add'
  require_relative 'argument_files/add'
when 'remove'
  require_relative 'argument_files/remove'
when 'help'
  require_relative 'argument_files/help'
  help
when '-v' || '--version'
  puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
  exit
else
  puts "#{Rainbow('Error').underline.red}: Unknown argument: #{ARGV[0]}"
end
