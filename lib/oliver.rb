require_relative 'oliver/hash'

module Oliver
  extend self

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

    # Hold commands
    @command = ''

    # Get strings of keys of commands
    basicCommands = advice(silent:true).keys_to_s

    # Command-line arguments
    options = { :verbose => true, :directory => false }

    # Option parsing, essentially
    until args.empty?
      case arg = args.shift
      when '--silent' then options[:verbose] = false
      when '--directory' then options[:directory] = true
      when *basicCommands
        @command << arg + ' '
      else
        puts "Warning: '#{arg}' not recognized"
        # exit
      end
    end

    puts @command
    puts options
  end

  def advice(info={}) # since help is a Ruby keyword
    advice = {
      :init => "initializes the main directory by creating a base dotfile",
      :install => "clones/removes repos if they're listed",
      :list => "list user repos",
      :update => "pull updates from each tracked repo",
      :version => "return the current version",
      :help => "return this help menu"
    }

    unless info[:silent]
      puts 'usage: olive [command] [arguments]'
      advice.map { |key, value| puts "#{key}    \t#{value}" }
    end

    return advice
  end
end
