require_relative 'oliver/version'
require_relative 'oliver/commands.rb'

module Oliver
  module_function

  def command
    @command ||= ''
  end

  def run(*args)
    if args.empty?
      advice
    else
      process args
    end
  end

  def process(*args)
    until args.empty?
      case args.shift
      when 'init' then Commands.init(args)
      when 'install' then Commands.install(args)
      when 'list' then Commands.list(args)
      when 'pull' then Commands.pull(args)
      when 'help' then Commands.help
      when 'version' then puts "Oliver #{Version::VERSION}"
    end
  end
end