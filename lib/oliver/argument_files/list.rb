require_relative '../file_manager'

# counter = 0
begin
  FileManager::YAML['repos'].map do |username, repos|
    if repos.nil?
      puts "#{Rainbow('Error').red.underline}: Your repos look a little nil."
      exit
    end
    repos.each do |repo|
      if File.directory?(repo)
        if Rainbow.enabled
          puts Rainbow(repo).green
        else
          puts Rainbow("+ #{repo}").green
        end
      else
        if Rainbow.enabled
          puts Rainbow(repo).red
        else
          puts Rainbow("- #{repo}").red
        end
      end
      # print "\t" if counter % 4 == 0
      # counter += 1
    end
  end
end
