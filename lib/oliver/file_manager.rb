def file_manager
  unless ARGV.nil?
    if File.file? Name::OLIVER
      body = File.read(Name::OLIVER.chomp)
      $final = YAML.load(body)
    else
      puts "#{Rainbow(Name::OLIVER).red} does not exist."
    end
  end
end
