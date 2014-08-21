# Require files
%w(rainbow YAML).each { |file| require file }
require_relative 'oliver/version'

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

# Arguments
require_relative 'oliver/arguments'

# Just exit at this point
exit
