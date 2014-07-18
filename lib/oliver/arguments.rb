# Different arguments
def different_arguments
  if ! ARGV[0].nil?
    if ARGV[0].downcase == 'init'

      if ! File.file?(Name::OLIVER)
        File.open(Name::OLIVER, 'w') do |file|
          file.write("repos:\n")
          file.write("   - \"trommel/oliver\"\n")
        end
      else
        puts "#{Rainbow(Name::OLIVER).red} already exists."
      end

      Jib.exit
    end
  end
end
