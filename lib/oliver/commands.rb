require 'json'
require 'git'
require 'fileutils'
require_relative 'file_name'
require_relative 'file_manager'

# Main commands
module Oliver
  module_function

  def init(options)
    options = options[:options]
    unless File.exists?(Oliver::NAME)
      File.open(Oliver::NAME, 'w') do |file|
        tempHash = { repos: { trommel: ["oliver"] } }
        file.write(JSON.pretty_generate(tempHash))
        puts "#{Oliver::NAME} created sucessfully" if options[:verbose]
      end
    end
  end

  def install(options)
    options = options[:options] # DRY
    FileManager::BODY['repos'].map do |user, repos|
      user  ||= ''
      repos ||= []

      unless user.empty? || repos.nil?
        repos.each do |repo|
          if File.directory?(repo)
            puts "Warning: #{repo}/ already exists"
          else
            if user.downcase == 'misc'
              cloned_repo = Git.clone(repo, repo.split('/').last, :path => '.')
            else
              cloned_repo = Git.clone(
                    "https://github.com/#{user}/#{repo}",
                    repo,
                    :path => '.'
                )
            end
            if File.directory?(repo) || File.directory?(repo.split('/').last)
              puts "Success: #{repo}/ has been cloned"
            else
              puts "Warning: #{repo}/ failed to clone"
            end
          end
        end
      end
    end
  end

  def list
    FileManager::BODY["repos"].map do |user, repos|
      repos ||= []
      # Add silent shit later when it's actually working
      unless repos.empty?
        repos.each do |repo|
          if File.directory?(repo) then print '# ' else print '+ ' end # bugs
          puts repo
        end
      end
    end
  end

  # Still buggy, afaik
  def update(options)
    options = options[:options] # DRY
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
