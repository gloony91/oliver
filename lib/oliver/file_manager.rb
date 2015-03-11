require 'json'

# Reads and parses the .olive file
module FileManager
  if File.file?(Oliver::NAME)
    begin
      body = File.read(Oliver::NAME)
      BODY = JSON.parse(body)
    rescue JSON::ParserError => e
      puts "Error: Double check your syntax: #{e}"
      BODY = {} # avoid any further errors
    end
  else
    puts "#{Oliver::NAME} does not exist."
    BODY = nil
  end
end
