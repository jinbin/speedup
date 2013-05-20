require './speedup.rb'

class A
	include Speedup
end

puts A.new.get_info_from_yaml :access_token
