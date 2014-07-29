def remove
  argument?(1)
  puts "removed #{Rainbow(ARGV[1]).red} from #{Rainbow('Olivefile').green}."
end
