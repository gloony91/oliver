# Require files
require 'optparse'
require_relative 'oliver_file_name'
require_relative 'argument_files/help'

def load_file_and_exit(path)
  require_relative path
  exit 1
end

# Default options
options = {
  :verbose => true,
  :silent  => false,
  :directory => false
}

case ARGV[0].downcase
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
  help
when '-v' || '--version'
  puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
  exit
else
  puts "#{Rainbow('Error').underline.red}: Unknown argument: #{ARGV[0]}"
end
