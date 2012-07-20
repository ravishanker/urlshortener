require 'uri'

class ShortlinkParser

	
	# class << self
	# 	def parse_shortlink(*args)
	# 		el = args.find { |e| e.present? }
	# 		match_for_shortlink(el)
	# 	end

	# 	def match_for_shortlink(el)
	# 		if el.try(:match, URI.regexp(['http', 'https']))
	# 			return URI.parse(el).path.gsub(/\//, '')
	# 		else
	# 			return el
	# 		end
	# 	end
	# end
end