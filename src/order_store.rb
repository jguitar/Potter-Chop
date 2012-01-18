require_relative './order_database'
require_relative './order'

class OrderStore
  
  def initialize(order_db)
    @order_db = order_db
  end
  
  def new_order(books, name, address)
    order = Order.new(books, name, address)
    if order.valid?
      return @order_db.get_orders.insert(order.to_hash)
    else
      return nil
    end
  end
  
  def order_list
    orders = @order_db.get_orders.find()
    result = []
    orders.each do |row|
      order = Order.new(row['books'], row['name'], row['address'])
      result << order
    end
    
    return result
  end
end
