require 'json'
require 'git'
require 'fileutils'
require_relative 'file_name'
require_relative 'file_manager'

# Main commands
module Oliver
  module_function

  def get_local_repos
    temp = []
    temp = Dir.entries('.').reject do |f|
      f['.'] || f['..'] || f[Oliver::NAME]
    end
    return temp.sort
  end

  def get_tracked_repos
    temp = []
    FileManager::BODY.map do |user, repo|
      temp << repo
    end
    return temp.sort.flatten
  end

  def init
    unless File.exists?(Oliver::NAME)
      File.open(Oliver::NAME, 'w') do |file|
        tempHash = { probablyjosh: ["oliver"] }
        file.write(JSON.pretty_generate(tempHash))
        puts "#{Oliver::NAME} created sucessfully" if @options[:verbose]
      end
    end
  end

  # I'm honestly ashamed of this piece of shit, it's hack as fuck
  def install
    unless FileManager::BODY.nil?
      FileManager::BODY.map do |user, repos|
        user  ||= ''
        repos ||= []

        # Add options[:verbose] support as soon as this doesn't look awful
        unless user.empty? || repos.nil?
          repos.each do |repo|

            unless File.directory?(repo)
              puts "Cloning #{repo}/"
              if user.downcase == 'misc'
                cloned_repo = Git.clone(
                      repo,
                      repo.split('/').last
                      )
              else
                cloned_repo = Git.clone(
                      "https://github.com/#{user}/#{repo}",
                      repo
                  )
              end

              if !cloned_repo.nil?
                puts "Success: #{repo}/ has been cloned" if @options[:verbose]
              else
                puts "Warning: #{repo}/ failed to clone"
              end

            end
          end
        end
      end

      dirRepos = get_local_repos
      trackedRepos = get_tracked_repos

      unless dirRepos == trackedRepos
        dirRepos ||= []
        trackedRepos ||= []
        dirRepos -= trackedRepos
        unless dirRepos.empty?
          dirRepos.each do |dirRepo|
            puts "Removing #{dirRepo}" if @options[:verbose]
            FileUtils.rm_rf(dirRepo)
          end
        end
      end

    end
  end

  def list
    dirRepos = get_local_repos
    trackedRepos = get_tracked_repos

    # If repo exists in
    # - .oliver and in directory, print "#" (neutral)
    # - only .oliver, print "+" (clone)
    # - only directory, print "-" (remove)

    # If the repo is in both, print #
    dirRepos.each do |repo|
      puts "# #{repo}" if trackedRepos.include? repo
    end

    # If repo only exists in .oliver, print '+'
    dirRepos.each do |repo|
      puts "- #{repo}" unless trackedRepos.include? repo
    end

    # If repo only exists in directory, print '-'
    trackedRepos.each do |repo|
      puts "+ #{repo}" unless dirRepos.include? repo
    end
  end

  # Still buggy, afaik
  def pull
    dirs = Dir.glob('*').select { |f| File.directory? f }
    dirs.each do |dir|
      Dir.chdir(dir)
      `git pull` # Hacks
      # puts "#{dir}/ has been updated" unless pull.include? 'Already up-to-date'
      Dir.chdir('..')
    end
  end
end
