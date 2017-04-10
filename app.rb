require 'sinatra'
require 'sinatra/content_for'
require 'yaml'

@@general_data = YAML.load_file('data/general.yml')
@@paragraph_data = YAML.load_file('data/paragraphs.yml')

configure do
  set :environment, "development"
end

get '/' do 
  erb :index
end

get '/utils/upload' do
  erb :upload
end

get '/utils/pdf' do
  @num_uploads = 5
  erb :pdf
end 
