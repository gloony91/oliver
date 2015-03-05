require 'json'
module FileManager
  if File.file? Oliver::NAME
    body = File.read(Oliver::NAME)
    OLIVER = JSON.parse(body)
  else
    puts "#{Oliver::NAME} does not exist."
    YAML = nil
  end
end
