module Oliver
  extend self

  def command?(arg)
    commands = %w(init install list update version help)
    commands.include? arg
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

    # Command-line arguments
    options = { :verbose => true } # add more here later

    # Option parsing, essentially
    until args.empty?
      case arg = args.shift
      when '--silent' then options[:verbose] = false
      else end
    end
  end

  def advice # since help is a Ruby keyword
    advice = {
      :init => "initializes the main directory by creating a base dotfile",
      :install => "clones/removes repos if they're listed",
      :list => "list user repos",
      :update => "pull updates from each tracked repo",
      :version => "return the current version",
      :help => "return this help menu"
    }

    puts 'usage: olive [command] [arguments]'
    advice.map { |key, value| puts "#{key}    \t#{value}" }
  end
end
