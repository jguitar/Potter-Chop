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
  order_store = OrderStore.new
  @list = order_store.order_list
  
  erb :list_orders
end

get '/api/order' do
  "Listing all orders\nIn construction"
end

post '/api/order' do
  order = Order.new(params['books'], params['name'], params['address'])
  if order.valid? then
    @price = order.get_price
    
    order_store = OrderStore.new
    order_store.new_order(order.books, order.name, order.address)
    
    erb :order_ok
  else
    erb :order_ko
  end
end
