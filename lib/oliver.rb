module Oliver
  def command
    @command || = ''
  end

  def run(*args)
    if *args.empty?
      help
    else
      process *args
    end
  end

  def process(*args)
    options = { :verbose => true }

    # Deal with the first argument8
    case args.first.downcase
    when
    when
    end

  end

  def help
  end
end
