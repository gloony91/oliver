# Require files
require_relative 'oliver_file_name'
require_relative 'argument_files/help'

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
when '-h' || '--help' || 'help'
  help
when '-v' || '--version' || 'version'
  puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
  exit
else
  puts "#{Rainbow('Error').underline.red}: Unknown argument: #{ARGV[0]}"
end
