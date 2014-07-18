require_relative "main"

# Help the user with their heavy troubles
def help

  helper = [
    [
      "add username/repo",
      "clone repo and add it to tracking list",
    ],

    [
      "remove username/repo",
      "delete repo and remove it from tracking list",
    ],

    [
      "list",
      "list repos currently on tracking list"
    ],

    [
      "update",
      "pull updates from each tracked repo"
    ]
  ]

  top_message = 'oliver - help / usage'

  puts Rainbow(top_message).red
  (top_message.length + 1).times { print Rainbow("=").yellow }
  puts

  helper.map do |line, blurb|
    puts "#{Rainbow(line).green} # => #{Rainbow(blurb).blue}"
  end

end

# Be totally ready if the user asks
# a question like "what version is oliver?"
# or "I need some help"
def other_things
  case ARGV[0].downcase
  when '-v' || '--version'
    puts "#{Rainbow('oliver').red} #{Rainbow("v#{Oliver::VERSION}").green}"
  when '-h' || '--help'
   help
  else
    help
  end
end

# If the user can't even
# specify basic arguments
# just give him/her some help
# and heavy medication
if ARGV[0].nil?
  help
  Jib.exit
end

# the main oliver "project" thing
# I'll probably move this into a
# seperate file in the future
def oliver_main
  run_main
end
