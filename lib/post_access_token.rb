require 'faraday'
require 'yaml'
require 'json'
require 'pry'

config = YAML.load_file("./speedup.yaml")
code = config[:code]

conn = Faraday.new(:url => "https://api.weibo.com/")

result = conn.post '/oauth2/access_token',:client_id => '44721943',:client_secret => '96e57fd158c96e1b4d961124dca55e56',:grant_type => 'authorization_code',:code => code,:redirect_uri => 'https://github.com/jinbin/speedup'

config[:access_token] = JSON.parse(result.env[:body])["access_token"]
File.open("./speedup.yaml","w") {|f| YAML.dump(config,f)} 
