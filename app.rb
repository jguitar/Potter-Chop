require 'sinatra'
require './models/order'
require './models/order_store'

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
  order = Order.new(params['books'], params['name'], params['address'])
  if order.valid? then
    #order_store = OrderStore.new
    #order_store.new_order(order.books, order.name, order.address)
    @price = order.get_price
    erb :order_ok
  else
    erb :order_ko
  end
end
