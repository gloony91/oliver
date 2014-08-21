if File.file? Name::OLIVER
  body = File.read(Name::OLIVER)
  $yaml = YAML.load(body)
else
  puts "#{Rainbow(Name::OLIVER).red} does not exist."
end
