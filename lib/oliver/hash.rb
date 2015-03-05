class Hash
  def keys_to_s
    commands = self.keys.to_s
    commands.tr!(':', '')
    commands.tr!('[', '')
    commands.tr!(']', '')
    puts 'test'
    return commands.split(', ')
  end
end
