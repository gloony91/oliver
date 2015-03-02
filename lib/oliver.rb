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
    options = { :verbose => true } # add more here later

    until args.empty?
      case arg = args.shift
      when '--silent' then options[:verbose] = false
      else end
    end
    
    # this should be evaluating to false if the user adds --silent
    puts options[:verbose]
  end

  def advice # since help is a Ruby keyword
    advice = {
      :init => "initializes the main directory by creating a base dotfile",
      :install => "clones/removes repos if they're listed",
      :list => "list user repos",
      :update => "pull updates from each tracked repo",
      :version => "return Oliver's version",
      :help => "return this help menu"
    }

    mainMessage = "oliver - help/usage"
    puts mainMessage
    mainMessage.length.times { print '=' }
    puts
    advice.map do |key, value|
      puts "#{key} # => #{value}"
    end
  end
end
