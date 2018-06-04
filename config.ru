require "sinatra"
require "sinatra/reloader" if development?
require_relative "controllers/user_controller.rb"

run UserController
