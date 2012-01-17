require 'mongo'

class Book_store
  
  def initialize
    @mongo = Mongo::Connection.new
    @db = @mongo.db("potterchop")
    @orders = @db["order"]
  end
  
  def clear_database
    @db.collections.each do |collection|
      @db.drop_collection(collection.name) unless collection.name =~ /indexes$/
    end
  end
  
  def new_order(books, name, address)
    if books.empty? || name == "" || address == ""
      return nil
    else
      order = Hash.new
      order['books'] = books
      order['name'] = name
      order['address'] = address
      
      return @orders.insert(order)
    end
  end
  
  def order_list
    result = []
    @orders.find().each do |row|
      order_string = "ID: #{row['_id']} Name: #{row['name']}"
      result << order_string
    end
    
    return result
  end
end
