require 'sinatra'
require 'sinatra/content_for'

get '/' do
  erb :index, :locals => {:name => 'juck'}
end