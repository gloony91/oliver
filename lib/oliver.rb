# holy shit, this is massive
# twss
require 'launchy'
require 'jibry'
require 'rainbow'
require 'YAML'
require 'git'
require_relative "oliver/version"
require_relative "oliver/methods"
require_relative "oliver/oliver_file_name"
require_relative "oliver/main"

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

# if `Name::OLIVER` (string)
# exists as a file continue with oliver
if File.file? Name::OLIVER
  run_main
else
  other_things
end
