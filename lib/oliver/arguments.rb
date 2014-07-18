# Different arguments

def different_arguments
  if ! ARGV[0].nil?
    if ARGV[0].downcase == 'init'
      puts "I'll implement this later"
      Jib.exit
    end
  end
end
