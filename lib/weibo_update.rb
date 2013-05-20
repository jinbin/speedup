
require 'pry'
require 'faraday'

def weibo_update(text)
	conn = Faraday.new(:url => 'https://api.weibo.com')
	conn.post '/2/statuses/update.json',:access_token => '2.00THiLsB0fNeBDe9a61bfb9f0BroaH',:status => text
end

result=weibo_update("测试")
