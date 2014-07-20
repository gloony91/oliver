# holy shit, this is massive
# twss
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

# Right off the bat,
# if the user doesn't specify even one argument
# just give him some help and quit oliver
if ARGV[0].nil?
  help
  exit
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
    exit
  else
    help
    exit
  end
else
  help
  exit
end
