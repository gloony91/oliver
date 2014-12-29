# Require files
require_relative 'oliver_file_name'
require_relative 'version'

def help
  require_relative 'argument_files/help'
end

# Default options
options = {
  :verbose   => true,
  :silent    => false,
  :directory => false,
  :colour    => ARGV[-1] == 'colour=on'
}

# Enable/Disable Rainbow
Rainbow.enabled = options[:colour]

require_relative 'oliver/settings'

# Help if user doesn't specify proper arguments
if ARGV.empty? || ARGV[0] == 'colour=on'
  help
else
  # Case for arguments
  case ARGV[0].downcase
  when 'colour=on'
    help
    exit
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
end
