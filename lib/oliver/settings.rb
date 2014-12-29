# Load .settings.yml to get user settings set to default
# For example, if the user specifies colour=on, do that by default
# Make this short and concise if possible
puts 'test'
require 'yaml'
module SettingsManager
  settingsName = '.settings.yml'
  if File.file? settingsName
    body = File.read(settingsName)
    YAML = YAML.load(body)
  else
    puts "#{Rainbow(settingsName).red} does not exist."
    YAML = nil
  end
end

puts SettingsManager::YAML
