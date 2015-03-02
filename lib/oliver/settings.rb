require 'yaml'

# Load .settings.yml to get user settings set to default
# For example, if the user specifies colour=on, do that by default
# Make this short and concise if possible

module SettingsManager
  settingsName = '.settings.yml'
  if File.file? settingsName
    body = File.read(settingsName)
    YAML = YAML.load(body)
    Rainbow.enabled = true if SettingsManager::YAML["colour"] == 'on'
  end
end
