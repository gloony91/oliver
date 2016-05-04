module Helpers
	module_function

	def log(text, priority='normal')
		message = "==> "
		case priority
		when 'normal'
			message.colorize(:blue) + text
		when 'warning'
			message.colorize(:yellow) + text
		when 'error'
			message.colorize(:red) + text
		when 'success'
			message.colorize(:green) + text
		else
		end
	end
end
