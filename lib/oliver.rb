require_relative 'oliver/hash'
require_relative 'oliver/version'

# Main Oliver module
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
    # Address 'passing through methods' issues (nesting arrays)
    args = args.first

    # Store commands
    @command = ''

    # Get strings of keys of commands
    basicCommands = advice(silent:true).keys_to_s

    # Command-line arguments
    @options = { verbose: true }

    # Option parsing, essentially
    until args.empty?
      case arg = args.shift
      when '--silent' then @options[:verbose] = false
      when '--directory' then @options[:directory] = true
      when 'version', '--version' then puts "oliver v#{Oliver::Version::STRING}"
      when 'help', '--help' then advice
      when *basicCommands
        @command << arg + ' '
      else
        puts "Unknown command: #{arg}"
        advice
        # exit
      end
    end

    # Build the command and do what you must
    build @command unless @command.empty?
  end

  def advice(info={}) # since help is a Ruby keyword
    advice = {
      init:    'initializes the main directory by creating a base dotfile',
      install: 'clones/removes repos if they\'re listed',
      list:    'list user repos',
      pull:    'pull updates from each tracked repo',
      version: 'return the current version',
      help:    'return this help menu',
    }

    unless info[:silent]
      puts 'usage: olive [command] [arguments]'
      advice.map { |key, value| puts "#{key}    \t#{value}" }
    end

     advice # Return advice
  end

  def build(commands)
    require_relative 'oliver/commands'
    @command = @command.split(' ')
    case @command.first
    when 'init' then init
    when 'install' then install
    when 'list' then list
    when 'pull', 'update' then pull
    else end
  end
end
