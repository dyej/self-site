require 'sinatra'
require 'sinatra/content_for'
require 'yaml'

get '/' do
  @general_data = YAML.load_file('data/general.yml')
  @paragraph_data = YAML.load_file('data/paragraphs.yml')
  erb :index
end 

#ERB is just ruby
# <% @collection.each do |value| %>
#   <%= value %>
# <% end %>