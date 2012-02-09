require 'sinatra'
require 'json'
require './models/order'
require './models/order_store'

get '/' do
  erb :index
end

get '/api/price' do
  order = Order.new(params[:books], "a", "a")
  data = {price:order.get_price}.to_json
  data
end

get '/api/order' do
  order_store = OrderStore.new
  list = order_store.order_list
  result = []
  list.each do |order|
    result << order.to_json
  end
  result.to_json
end

post '/api/order' do
  order = Order.new(params['books'], params['name'], params['address'])
  if order.valid? then
    order_store = OrderStore.new
    order_store.new_order(order.books, order.name, order.address)
  end
  return ""
end
