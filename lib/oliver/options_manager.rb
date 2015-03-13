# Work with user settings defined in .settings
module Options
  optionsName = '.options'
  if File.file? optionsName
    body = File.read(optionsName)
    # Verbose is true if the file doesn't contain --silent
    VERBOSE = !body.include?('--silent')
  end
end
