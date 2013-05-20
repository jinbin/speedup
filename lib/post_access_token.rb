require 'faraday'
require 'pry'

conn = Faraday.new(:url => "https://api.weibo.com/")

=begin
result = conn.get 'oauth2/authorize',:client_id => '44721943',:redirect_uri => 'https://github.com/jinbin/speedup'

binding.pry
=end

result = conn.post '/oauth2/access_token',:client_id => '44721943',:client_secret => '96e57fd158c96e1b4d961124dca55e56',:grant_type => 'authorization_code',:code => '29751fb43ac01cb3365a9b87b8617d28',:redirect_uri => 'https://github.com/jinbin/speedup'

binding.pry
puts result
