require 'sinatra'
require_relative 'config'

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH'
    color: 'DodgerBlue'
  }
end

# ... (only showing relevant part of code)
get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
    "<h1 style=\"background-color:#{color};\">Hello #{name}!</h1>"
  erb :message, locals: {
    name: name,
    color: color
  }
end