# Main oliver file
def run_main
  if ARGV[1].downcase == 'init'
    puts "I'll implement this later"
  else
    body = File.read(Name::OLIVER.chomp)
    final = YAML.load("---\n#{body}\n---")
    final["repos"].each do |repo|
      %x(git clone git://github.com/#{repo} --quiet)
    end
  end
end
