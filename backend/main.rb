require 'bundler'
Bundler.require
require 'json'
require 'yaml'
require 'securerandom'
require 'date'

env = ENV['MIDORI_ENV'] ? ENV['MIDORI_ENV'] : 'development'

Dir[File.dirname(__FILE__) + '/middlewares/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/routes/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

Midori::Configure.before = proc do
  DB = Sequel.connect(YAML.load_file('config/db.yml')[env])
  Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
  Dir[File.dirname(__FILE__) + '/ohm_models/*.rb'].each { |file| require file }
end

class Route < Midori::API
  env = ENV['MIDORI_ENV'] ? ENV['MIDORI_ENV'] : 'development'
  # Handling Cors
  use CorsMiddleware
  options '*' do;end

  mount '/user', UserRoute
  mount '/post', PostRoute
  mount '/atom', AtomRoute
  mount '', ErrorRoute
end

Midori::Configure.set :port, 8081
Midori::Runner.new(Route).start if __FILE__ == $0
