require_relative '../oliver_file_name'
# Help the user with their heavy troubles
helper = [
  [
    'init',
    "initializes the main directory by creating a base dotfile"
  ],

  [
    'install',
    "clones/removes repos if they're listed"
  ],

  [
    'list',
    "list repos currently on #{Name::OLIVER}"
  ],

  [
    'update',
    "pull updates from each tracked repo"
  ],

  [
    '-v',
    'return oliver\'s version'
  ],

  [
    '-h',
    'return this help menu'
  ]
]

top_message = 'oliver - help / usage'

puts Rainbow(top_message).red
(top_message.length + 1).times { print Rainbow('=').yellow }
puts

helper.map do |line, blurb|
  puts "#{Rainbow(line).green} # => #{Rainbow(blurb).blue}"
end
