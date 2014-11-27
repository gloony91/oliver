# Require files
require 'rainbow'
require_relative 'oliver/version'
require_relative 'oliver/argument_files/help'

# Provide help if no arguments are specified
help && exit if ARGV[0].nil?

# if the user wants to use rainbow
Rainbow.enabled = false

# Arguments
require_relative 'oliver/arguments'

# Just exit at this point
exit
