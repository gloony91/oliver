require 'json'
require 'git'
require 'fileutils'
require_relative 'file_name'
require_relative 'file_manager'

# Main commands
module Oliver
  module_function

  def init
    unless File.exists?(Oliver::NAME)
      File.open(Oliver::NAME, 'w') do |file|
        tempHash = { trommel: ["oliver"] }
        file.write(JSON.pretty_generate(tempHash))
        puts "#{Oliver::NAME} created sucessfully" if @options[:verbose]
      end
    end
  end

  # I'm honestly ashamed of this, it's hack as fuck
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

              begin
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
                puts "Success: #{repo}/ has been cloned" if @options[:verbose]
              rescue
                puts "Warning: #{repo}/ failed to clone"
              end

            end
          end
        end
      end

      dirRepos = Dir.entries('.').reject do |f|
        f['.'] || f['..'] || f[Oliver::NAME]
      end
      dirRepos.sort!

      trackedRepos ||= []
      FileManager::BODY.each do |user|
        user[1].each { |repo| trackedRepos << repo }
      end
      trackedRepos.sort!

      unless dirRepos == trackedRepos
        dirRepos ||= []
        trackedRepos ||= []
        dirRepos -= trackedRepos
        unless dirRepos.empty?
          dirRepos.each { |dirRepo| FileUtils.rm_rf(dirRepo) }
        end
      end

    end
  end

  def list
    unless FileManager::BODY.nil?
      FileManager::BODY.map do |user, repos|
        repos ||= []

        unless repos.empty?
          repos.each do |repo|
            # get this working with repos that are going to be uninstalled too
            if File.directory?(repo) then print '# ' else print '+ ' end
            puts repo
          end
        end

      end
    end
  end

  # Still buggy, afaik
  def update
    dirs = Dir.glob('*').select { |f| File.directory? f }
    dirs.each do |dir|
      Dir.chdir(dir)
      g = Git.open(Dir.pwd)
      pull = g.pull
      puts "#{dir}/ has been updated" unless pull.include? 'Already up-to-date'
      Dir.chdir('..')
    end
  end
end
