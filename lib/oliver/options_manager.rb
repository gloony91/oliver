# Work with user settings defined in .settings
module Options
  optionsName = '.settings'
  if File.file? settingsName
    body = File.read(optionsName)
    # Verbose is true if the file doesn't contain --silent
    VERBOSE = !body.include?('--silent')
  end
end
