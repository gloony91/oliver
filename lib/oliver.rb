# Require files
require 'rainbow'
require_relative 'oliver/version'
require_relative 'oliver/argument_files/help'

# Provide help if no arguments are specified
help && exit if ARGV[0].nil?

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

# Arguments
require_relative 'oliver/arguments'

# Just exit at this point
exit
