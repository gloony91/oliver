require_relative '../oliver_file_name'
unless ARGV[1].nil?
  if ARGV[2].nil?
    dir_name = 'olives'
  else
    dir_name = ARGV[2]
  end
  if ARGV[1].downcase == '--directory' || ARGV[1].downcase == '-d'
    if !File.directory?(dir_name)
      Dir.mkdir(dir_name)
      Dir.chdir(dir_name)
    else
      puts "#{Rainbow('Error').underline.red}: #{dir_name}/ already exists."
      exit
    end
    puts "#{Rainbow(dir_name).green}/ has been created."
  end
end

if !File.file?(Name::OLIVER)
  File.open(Name::OLIVER, 'w') do |file|
    file.write("---\nrepos:\n")
    file.write("   trommel:\n      - \"oliver\"\n---\n")
    dir_name = '.' if dir_name.nil?
    green_dir_name = Rainbow(dir_name).green
    green_oliver_file_name = Rainbow(Name::OLIVER).green
    puts "#{green_dir_name}/#{green_oliver_file_name} has been created."
  end
else
  puts "#{Rainbow(Name::OLIVER).red} already exists."
end
