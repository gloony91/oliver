# Require files
require 'optparse'
require_relative 'oliver_file_name'

def load_file_and_exit(path)
  require_relative path
  exit 1
end

# Default options
options = {
  :verbose => true,
  :silent  => false,
  :directory => false
}

optparse = OptionParser.new do |opts|
  opts.on('-i', '--init', "") do |verbose|
    # load_file_and_exit 'argument_files/init'
    puts 'init'
    puts verbose
  end
  opts.on('-s', '--install', 'install and/or remove listed repos') do
    # load_file_and_exit 'argument_files/install'
    puts 'install'
  end
  opts.on('-l', '--list', 'list tracked repos') do
    # load_file_and_exit 'argument_files/list'
    puts 'list'
  end
  opts.on('-u', '--update', 'essentially git pull each repo') do
    # load_file_and_exit 'argument_files/update'
    puts 'update'
  end
  opts.on('-a', '--add', "add a repo to the #{Name::OLIVER}") do
    # load_file_and_exit 'argument_files/add'
    puts 'add'
  end
  opts.on('-r', '--remove', "remove a repo from the #{Name::OLIVER}") do
    # load_file_and_exit 'argument_files/remove'
    puts 'remove'
  end
  opts.on('-v', '--version', 'Return the version') do
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
    exit
  end
  opts.on('-h', '--help', 'Display this screen') do
    puts optparse
  end
end

begin optparse.parse! ARGV
rescue OptionParser::InvalidOption => error
  puts error
  exit 1
end
