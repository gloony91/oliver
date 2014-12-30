require 'yaml'
module FileManager
  if File.file? Name::OLIVER
    body = File.read(Name::OLIVER)
    YAML = YAML.load(body)
  else
    puts "#{Rainbow(Name::OLIVER).red} does not exist."
    YAML = nil
    exit
  end
end
