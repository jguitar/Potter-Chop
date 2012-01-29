require './models/order_database'
require './models/order'

class OrderStore
  
  def new_order(books, name, address)
    order = Order.new(books, name, address)
    if order.valid?
      return get_repo.insert(order)
    else
      return nil
    end
  end
  
  def order_list
    orders = get_repo.get_orders
    result = []
    orders.each do |row|
      order = Order.new(row['books'], row['name'], row['address'])
      result << order
    end
    
    return result
  end
  
  private
  
  def get_repo
    @order_db = OrderDatabase.new if @order_db.nil?
    return @order_db
  end
end
