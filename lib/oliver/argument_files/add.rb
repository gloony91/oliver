def add
  argument?(1)
  puts "todo: add (#{ARGV[1]}) to #{Name::OLIVER}"
  # puts "added #{Rainbow(ARGV[1]).green} to #{Rainbow(Name::OLIVER).green}."
end
