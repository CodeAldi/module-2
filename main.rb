require 'sinatra'
#require_relative 'config'

get '/' do
  'This is the home page. You will see this if you don\'t specify any specific route.'
end

get '/messages' do
  erb :message, locals: {
    name: 'GenerasiGIGIH',
    color: 'DodgerBlue'
  }
end


get '/messages/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
    "<h1 style=\"background-color:#{color};\">Hello #{name}!</h1>"
  erb :message, locals: {
    name: name,
    color: color
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password']=='admin'
    redirect '/messages'
  else
    redirect '/login'
  end
end

get '/items' do
  erb :"/items/index"
end

post '/items' do
  @name = params["name"]
  @category = params["category"]
  @price = params["price"]
  erb :"/items/index"
end

get '/items/new' do
  erb :"/items/new"
end