require 'sinatra'
require 'sinatra/content_for'
require 'yaml'

@@general_data = YAML.load_file('data/general.yml')
@@paragraph_data = YAML.load_file('data/paragraphs.yml')

get '/' do 
  erb :index
end

get '/upload' do
  erb :upload
end 
