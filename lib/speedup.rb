require "speedup/version"
require 'faraday'
require 'yaml'
require 'json'
require 'pry'

module Speedup
  class << self
    def weibo(text)
      Speedup::Weibo.new.weibo(text)
    end
	
    def code(code, isforce=false)
      Speedup::Weibo.new.write_code(code,isforce)
    end
  end

  class Weibo
    def write_code code, isforce=false
      config = YAML.load_file(File.expand_path("./config.yml",File.dirname(__FILE__)))
      if config[:code].nil?
        config[:code] = code	
      elsif !config[:code].nil? and !isforce 
      elsif !config[:code].nil? and isforce
        config[:code] = code
      end	
      File.open(File.expand_path("./config.yml",File.dirname(__FILE__)),"w") {|f| YAML.dump(config,f)}
    end

    def write_access_token
      config = YAML.load_file(File.expand_path("./config.yml",File.dirname(__FILE__)))
      if config[:code].nil?
        puts "\ncode missing\n\n"
        exit 1
      end
      if config[:access_token].nil?
        code = config[:code]
        conn = Faraday.new(:url => "https://api.weibo.com/")

        result = conn.post '/oauth2/access_token',:client_id => '44721943',:client_secret => '96e57fd158c96e1b4d961124dca55e56',:grant_type => 'authorization_code',:code => code,:redirect_uri => 'http://jinbin.com/callback'

        config[:access_token] = JSON.parse(result.env[:body])["access_token"]
        File.open(File.expand_path("./config.yml",File.dirname(__FILE__)),"w") {|f| YAML.dump(config,f)}	
      end
    end

    def weibo(text)
      write_access_token
      file = File.expand_path("./config.yml",File.dirname(__FILE__))
      token = YAML::load_file(file)[:access_token]
      conn = Faraday.new(:url => 'https://api.weibo.com')
      result = conn.post '/2/statuses/update.json',:access_token => token,:status => text
    end
  end
end

