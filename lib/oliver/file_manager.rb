require 'json'

# Reads and parses the .olive file
module FileManager
  if File.file?(Oliver::NAME)
    body = File.read(Oliver::NAME)
    BODY = JSON.parse(body)
  else
    puts "#{Oliver::NAME} does not exist."
    BODY = nil
  end
end
