require 'yaml'
module FileManager
  if File.file? Name::OLIVER
    body = File.read(Name::OLIVER)
    YAML = YAML.load(body)
  else
    puts "#{Name::OLIVER} does not exist."
    YAML = nil
  end
end
