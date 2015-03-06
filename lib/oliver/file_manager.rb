require 'json'

# Reads and parses the .olive file
module FileManager
  if File.file?(Oliver::NAME)
    body = File.read(Oliver::NAME)
    BODY = JSON.parse(body)
  else
<<<<<<< HEAD
    puts "#{Rainbow(Name::OLIVER).red} does not exist."
    YAML = nil
    exit
=======
    puts "#{Oliver::NAME} does not exist."
    BODY = nil
>>>>>>> cleanup
  end
end
