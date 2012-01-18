require_relative './order_database'

class OrderStore
  
  def initialize(order_db)
    @order_db = order_db
  end
  
  def new_order(books, name, address)
    if books.empty? || name == "" || address == ""
      return nil
    else
      order = Hash.new
      order['books'] = books
      order['name'] = name
      order['address'] = address
      
      return @order_db.get_orders.insert(order)
    end
  end
  
  def order_list
    orders = @order_db.get_orders.find()
    result = []
    orders.each do |row|
      order_string = "ID: #{row['_id']} Name: #{row['name']}"
      result << order_string
    end
    
    return result
  end
end
