require 'sinatra'
require 'sinatra/content_for'
require 'yaml'

@@general_data = YAML.load_file('data/general.yml')
@@paragraph_data = YAML.load_file('data/paragraphs.yml')
@@num_uploads = 5

configure do
 # set :environment, "production"
end

helpers do
  def pdf_combine(params)
    params.keys.each do |key|
      p = params[key]
      if key.include? 'file' #&& !param[:filename].nil?
        puts p
      end
    end
  end

  def pdf_add()
    puts "add"
  end
end

get '/' do 
  erb :index
end

get '/utils/pdf' do
  erb :pdf
end 

post '/utils/pdf/combine' do
  if params[:commit] == '+'
    @@num_uploads += 1
    puts params
    pdf_add()
    redirect to('/utils/pdf')
  elsif params[:commit] == 'Submit'
    @combined_pdf = pdf_combine(params)
  end
end
