# Add a method to hash for easier conversion of keys to string
class Hash
  def keys_to_s
    commands = keys.to_s
    commands.tr!(':', '')
    commands.tr!('[', '')
    commands.tr!(']', '')
    commands.split(', ')
  end
end
