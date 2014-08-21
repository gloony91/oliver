# Require files
files = %w(add init install list remove update help)
files.each do |file|
  require_relative "argument_files/#{file}"
end

# Default options
options = {
  :verbose => true,
  :silent  => false
}

# `argument?` returns help if the
# specified argument is nonexistant
def argument?(argument_number)
  help if ARGV[argument_number].nil?
end

# Different arguments
def arguments
  case ARGV[0].downcase
  when 'install'
    file_manager
    install
  when 'init'
    file_manager
    init
  when 'list'
    file_manager
    list
  when 'update'
    file_manager
    update
  when 'add'
    file_manager
    add
  when 'remove'
    file_manager
    remove
  when 'help'
    help
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
    exit
 else
    puts "#{Rainbow('Error').underline.red}: Unknown argument: #{ARGV[0]}"
 end
  exit
end
