require 'json'
require_relative 'file_name'
require_relative 'file_manager'

# Main commands
module Oliver
  module_function

  def init(options)
    options = options[:options]
    unless File.exists?(Oliver::NAME)
      File.open(Oliver::NAME, 'w') do |file|
        tempHash = { repos: { trommel: ["oliver"] } }
        file.write(JSON.pretty_generate(tempHash))
        puts "#{Oliver::NAME} created sucessfully" if options[:verbose]
      end
    end
  end

  def install
    puts "TODO: install"
  end

  def list
    counter = 0
    FileManager::BODY["repos"].map do |user, repos|
      repos ||= []
      unless repos.empty?
        repos.each do |repo|
          if File.directory?(repo) then print '+ ' else print '# ' end
          puts repo
          print "\t" unless counter % 4 == 0
          counter += 1
        end
      end
    end
  end

  def update
    puts "TODO: update"
  end
end
