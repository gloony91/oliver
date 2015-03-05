require 'json'

# Reads and parses the .olive file
module FileManager
  if File.file?(Oliver::NAME)
    body = File.read(Oliver::NAME)
    CONTENT = JSON.parse(body)
  else
    puts "#{Oliver::NAME} does not exist."
    YAML = nil
  end
end
