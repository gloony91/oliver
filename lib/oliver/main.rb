# Main oliver file
require 'awesome_print'
def run_main
  body = File.read(Name::OLIVER.chomp)
  final = YAML.load("---\n#{body}\n---")
  final["repos"].each do |repo|
    %x(git clone git://github.com/#{repo} --quiet)
  end
end
