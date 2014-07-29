def add
  argument?(1)
  puts "added #{Rainbow(ARGV[1]).green} to #{Rainbow('Olivefile').green}."
end
