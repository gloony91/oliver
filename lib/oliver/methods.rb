# Help the user with their heavy troubles
def help

  helper = [
    [
      "init",
      "initializes the main directory by creating a base #{Name::OLIVER}"
    ],

    [
      "install",
      "clones / removes directories if they're listed on the #{Name::OLIVER}"
    ],

    [
      "add username/repo",
      "clone repo and add it to the #{Name::OLIVER}",
    ],

    [
      "remove username/repo",
      "delete repo and remove it from the #{Name::OLIVER}",
    ],

    [
      "list",
      "list repos currently on the #{Name::OLIVER}"
    ],

    [
      "update",
      "pull updates from each tracked repo on the #{Name::OLIVER}"
    ],

    [
      "-v",
      "return oliver's version"
    ],

    [
      "-h",
      "return this help menu"
    ]
  ]

  top_message = 'oliver - help / usage'

  puts Rainbow(top_message).red
  (top_message.length + 1).times { print Rainbow("=").yellow }
  puts

  helper.map do |line, blurb|
    puts "#{Rainbow(line).green} # => #{Rainbow(blurb).blue}"
  end

  Jib.exit

end

# Be totally ready if the user asks
# a question like "what version is oliver?"
# or "I need some help"
def other_things
  case ARGV[0].downcase
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
    Jib.exit
  when '-h' || '--help'
   help
  end
end
