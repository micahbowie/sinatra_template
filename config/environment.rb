ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'pg'
require "sinatra/activerecord"
Bundler.require(:default, ENV['SINATRA_ENV'])

# ActiveRecord::Base.establish_connection(
#   adapter: "pg",
#   database: "postgres" # TODO: create a databse for your app and add it here.
# )

require './app/controllers/application_controller'
require_all 'app'
