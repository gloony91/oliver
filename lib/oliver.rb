# holy shit, this is massive
# twss
require 'rainbow'
require 'YAML'
%w(oliver_file_name file_manager arguments version).each do |file|
  require_relative "oliver/#{file}"
end

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

# Arguments
arguments

# just exit at this point
exit
