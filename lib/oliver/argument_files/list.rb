# For later (possible) Hash implementation
# def list
#   listed_repos = []
#   # todo: if user has multiple repos,
#   # have one user key with an array of
#   # the user's repos
#   $yaml['repos'].each do |thing|
#     new_thing = thing.split('/')
#     listed_repos.push(new_thing)
#   end
#   puts listed_repos.to_h
# end

# Simple enough :P
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
