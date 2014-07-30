def remove
  argument?(1)
  puts "todo: remove (#{ARGV[1]}) to #{Name::OLIVER}"
  # puts "removed #{Rainbow(ARGV[1]).red} from #{Rainbow('Olivefile').green}."
end
