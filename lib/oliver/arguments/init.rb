def init
  if !File.file?(Name::OLIVER)
    File.open(Name::OLIVER, 'w') do |file|
      file.write("repos:\n")
      file.write("   - \"trommel/oliver\"\n")
      puts "#{Rainbow(Name::OLIVER).green} has been created."
    end
  else
    puts "#{Rainbow(Name::OLIVER).red} already exists."
  end
end
