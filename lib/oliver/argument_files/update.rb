require_relative '../oliver_file_name'
require 'git'
# puts "TODO: pull updates from each tracked repo on the #{Name::OLIVER}"
dirs = Dir.glob('*').select { |f| File.directory? f }

dirs.each do |dir|
  Dir.chdir(dir)
  g = Git.open(Dir.pwd)
  pull = g.pull
  puts "#{dir}/ has been updated." if !pull.include? 'Already up-to-date'
  Dir.chdir('..')
end
