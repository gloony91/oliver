require_relative 'oliver/version'
require_relative 'oliver/commands'
require_relative 'oliver/helpers'
require 'colorize'
require 'json'
require 'git'

module Oliver
  module_function

  def command
    @command ||= ''
  end

  def run(*args)
    if args.empty?
      Commands.help
    else
      process args.shift
    end
  end

  def process(*args)
    case arg = args.shift
    when 'init' then Commands.init(args)
    when 'install' then Commands.install(args)
    when 'list' then Commands.list(args)
    when 'pull' then Commands.pull(args)
    when 'help' then Commands.help
    when 'version' then puts "oliver version #{Version::VERSION}".colorize(:green)
    else
      puts "oliver: '#{arg}' is not a recognized command.".colorize(:red)
    end
  end

end