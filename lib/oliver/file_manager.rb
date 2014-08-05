def file_manager
  unless ARGV.nil?
    if File.file? Name::OLIVER
      body = File.read(Name::OLIVER.chomp)
      $final = YAML.load("---\n#{body}\n---")
    else
      puts "#{Rainbow(Name::OLIVER).red} does not exist."
    end
  end
end
