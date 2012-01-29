require 'mongo'
require './models/order'

class OrderDatabase
  DB_NAME = "potterchop"
  ORDER_COLLECTION = "order"
  
  def initialize
    @mongo = Mongo::Connection.new
    @db = @mongo.db(DB_NAME)
    @orders = @db[ORDER_COLLECTION]
  end
  
  def clear
    @db.collections.each do |collection|
      @db.drop_collection(collection.name) unless collection.name =~ /indexes$/
    end
  end
  
  def get_orders
    @orders.find()
  end
  
  def insert(order)
    @orders.insert(order.to_hash)
  end
end
