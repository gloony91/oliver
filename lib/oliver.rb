require 'colorize'
require 'json'
require 'git'
require 'fileutils'

require_relative 'oliver/version'
require_relative 'oliver/helpers'
require_relative 'oliver/commands'

module Oliver
  module_function

  def run(*args)
    if args.empty?
      Commands.help
    else
      process args
    end
  end

  def version
    "oliver version #{Version::VERSION}".colorize(:green)
  end

  def process(args)
    case arg = args.shift
    when 'init' then Commands.init(args)
    when 'update' then Commands.update(args)
    when 'list' then Commands.list(args)
    when 'pull' then Commands.pull(args)
    when 'add' then Commands.add(args)
    when 'remove' then Commands.remove(args)
    when 'help' then Commands.help
    when 'version' then puts version
    else
      puts "oliver: '#{arg}' is not a recognized command.".colorize(:red)
    end
  end

end
