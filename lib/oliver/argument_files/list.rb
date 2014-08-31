counter = 0
$yaml['repos'].map do |username, repos|
  if repos.nil?
    puts "#{Rainbow('Error').red.underline}: Your repos look a little nil."
    exit
  end
  repos.each do |repo|
    if File.directory?(repo)
      print Rainbow(repo).green
    else
      print Rainbow(repo).red
    end
    print "\t" if counter % 4 == 0
    counter += 1
  end
end
puts
