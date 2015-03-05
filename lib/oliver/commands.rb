require 'json'
require_relative 'file_name'

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
    puts "TODO: list"
  end

  def update
    puts "TODO: update"
  end
end
