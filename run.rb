require 'yaml'

file = File.read('test.yml')
$yaml = YAML.load(file)

def clone
  $yaml['repos'].map do |username, repos|
    repos.each do |repo|
      if !File.directory?(repo)
        `git clone git://github.com/#{username}/#{repo} --quiet`
        if File.directory? repo
          puts "Successfully cloned #{username}/#{repo}."
        else
          puts "There was an error while cloning #{repo}."
        end
      else
        puts "#{repo} already exists."
      end
    end
  end
end

clone
