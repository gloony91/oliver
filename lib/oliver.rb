# holy shit, this is massive
# twss
require 'jibry'
require 'rainbow'
require 'YAML'
require_relative "oliver/oliver_file_name"
require_relative "oliver/arguments"
require_relative "oliver/version"
require_relative "oliver/methods"
require_relative "oliver/main"

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

if ARGV[0].nil?
  help
  Jib.exit
end

# (Literally) different arguments
different_arguments

# (Literally) other things
other_things

# if `Name::OLIVER` (string)
# exists as a file continue with oliver
if File.file? Name::OLIVER
  if ARGV[0].downcase == 'install'
    run_main
    Jib.exit
  else
    name_install = Rainbow('oliver install').red
    name_color = Rainbow(Name::OLIVER).red
    puts "#{name_install} requires an #{name_color} to do its magic."
    Jib.exit
  end
else
  help
  Jib.exit
end
