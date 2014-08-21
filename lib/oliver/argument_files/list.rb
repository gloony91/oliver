counter = 0
$yaml['repos'].each do |thing|
  repo = thing.split('/')[1] # might as well discard the username
  if File.directory?(repo)
    print Rainbow(repo).green
  else
    print Rainbow(repo).red
  end
  print "\t" if counter % 4 == 0
  counter += 1
end
puts
