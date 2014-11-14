require_relative '../oliver_file_name'
require 'git'
dirs = Dir.glob('*').select { |f| File.directory? f }
puts 'theoretically this should work but there will be tons of bugs' # enjoy!!
dirs.each do |dir|
  Dir.chdir(dir)
  g = Git.open(Dir.pwd)
  pull = g.pull
  puts "#{dir}/ has been updated." if !pull.include? 'Already up-to-date'
  Dir.chdir('..')
end
