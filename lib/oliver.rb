# Require files
%w(rainbow YAML).each { |file| require file }
require_relative 'oliver/version'
require_relative 'oliver/argument_files/help'

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

# Provide help if no arguments are specified
help if ARGV.nil?

# Arguments
require_relative 'oliver/arguments'

# Just exit at this point
exit
