#require "speedup/version"
require 'faraday'
require 'yaml'

module Speedup
	def get_info_from_yaml key
		YAML::load_file('./speedup.yaml')[key]
	end

	def weibo_send_text(text)
		token = get_info_from_yaml(:access_token)
		conn = Faraday.new(:url => 'https://api.weibo.com')
		conn.post '/2/statuses/update.json',:access_token => token,:status => text
	end
end

