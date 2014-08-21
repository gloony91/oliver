# Require files
%w(rainbow YAML).each { |file| require file }
require_relative 'oliver/version'

# if the user doesn't want to use rainbow
# just disable it completely
Rainbow.enabled = false if ARGV[-1] == 'colour=off'

# if the user doesn't specify even one argument
# just give him some help and quit oliver
help && exit if ARGV[0].nil?

# Arguments
require_relative 'oliver/arguments'

# Just exit at this point
exit
