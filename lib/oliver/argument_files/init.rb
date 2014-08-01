def init
  unless ARGV[1].nil?
    if ARGV[2].nil?
      dir_name = 'olives'
    else
      dir_name = ARGV[2]
    end
    if ARGV[1].downcase == '--directory'
      Dir.mkdir dir_name
      Dir.chdir(dir_name)
      random_text = Rainbow('Changed directory').blue
      puts "#{Rainbow(dir_name).green}/ has been created."
      puts "#{random_text} into #{Rainbow(dir_name).green}/."
    end
  end

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
