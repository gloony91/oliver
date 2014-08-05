def init
  unless ARGV[1].nil?
    if ARGV[2].nil?
      dir_name = 'olives'
    else
      dir_name = ARGV[2]
    end
    if ARGV[1].downcase == '--directory' || ARGV[1].downcase == '-d'
      Dir.mkdir dir_name
      Dir.chdir(dir_name)
      puts "#{Rainbow(dir_name).green}/ has been created."
    end
  end

  if !File.file?(Name::OLIVER)
    File.open(Name::OLIVER, 'w') do |file|
      file.write("repos:\n")
      file.write("   - \"trommel/oliver\"\n")
      puts "#{Rainbow(dir_name).green}/#{Rainbow(Name::OLIVER).green} has been created."
    end
  else
    puts "#{Rainbow(Name::OLIVER).red} already exists."
  end
end
