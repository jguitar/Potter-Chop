require 'sinatra'

get '/' do
  erb :index
end

get '/new_order' do
  erb :new_order
end

get '/list_orders' do
  erb :list_orders
end

get '/api/order' do
  "Listing all orders\nIn construction" 
end

post '/api/order' do
  "OK!"
end
